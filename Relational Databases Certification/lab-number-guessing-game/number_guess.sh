#!/bin/bash

PSQL=(psql --username=freecodecamp --dbname=number_guess -t --no-align --quiet --set=ON_ERROR_STOP=1)

echo "Enter your username:"
read -r username

user_info=$("${PSQL[@]}" -v username="$username" <<'SQL'
SELECT id || '|' ||
       (SELECT COUNT(*) FROM games WHERE user_id = users.id) || '|' ||
       COALESCE((SELECT MIN(guess_count) FROM games WHERE user_id = users.id), 0)
FROM users
WHERE username = :'username';
SQL
) || exit

if [[ -z "$user_info" ]]; then
	user_id=$("${PSQL[@]}" -v username="$username" <<'SQL'
INSERT INTO users (username)
VALUES (:'username')
RETURNING id;
SQL
) || exit
	printf 'Welcome, %s! It looks like this is your first time here.\n' "$username"
else
	IFS='|' read -r user_id games_played best_game <<< "$user_info"
	printf 'Welcome back, %s! You have played %s games, and your best game took %s guesses.\n' \
		"$username" "$games_played" "$best_game"
fi

secret_number=$((RANDOM % 1000 + 1))
number_of_guesses=0
guessed_correctly=false

echo "Guess the secret number between 1 and 1000:"
while read -r guess; do
	if ! [[ "$guess" =~ ^-?[0-9]+$ ]]; then
		echo "That is not an integer, guess again:"
		continue
	fi

	if [[ "$guess" == -* ]]; then
		guess_value=$((-10#${guess#-}))
	else
		guess_value=$((10#$guess))
	fi

	number_of_guesses=$((number_of_guesses + 1))
	if ((guess_value > secret_number)); then
		echo "It's lower than that, guess again:"
	elif ((guess_value < secret_number)); then
		echo "It's higher than that, guess again:"
	else
		printf 'You guessed it in %s tries. The secret number was %s. Nice job!\n' \
			"$number_of_guesses" "$secret_number"
		guessed_correctly=true
		break
	fi
done

if [[ "$guessed_correctly" != true ]]; then
	exit 1
fi

"${PSQL[@]}" -v secret_number="$secret_number" \
	-v number_of_guesses="$number_of_guesses" \
	-v user_id="$user_id" <<'SQL'
INSERT INTO games (secret_number, guess_count, user_id)
VALUES (:'secret_number', :'number_of_guesses', :'user_id');
SQL
