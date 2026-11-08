#! /bin/bash

PSQL() {
	psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c "$1"
}

PSQL_QUIET() {
	psql --username=freecodecamp --dbname=salon --quiet --tuples-only --no-align -c "$1"
}

display_services() {
	while IFS='|' read -r service_id service_name; do
		printf '%s) %s\n' "$service_id" "$service_name"
	done < <(PSQL "select service_id, name from services order by service_id")
}

printf '~~~~~ MY SALON ~~~~~\n\n'
printf 'Welcome to My Salon, how can I help you?\n\n'

while true; do
	display_services
	printf 'Please enter a service_id: '
	read SERVICE_ID_SELECTED

	if [[ "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]; then
		SERVICE_NAME=$(PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
	else
		SERVICE_NAME=''
	fi

	if [[ -n "$SERVICE_NAME" ]]; then
		break
	fi

	printf '\nI could not find that service. What would you like today?\n'
done

printf '\nWhat\x27s your phone number? '
read CUSTOMER_PHONE
CUSTOMER_PHONE_SQL=$(printf '%s' "$CUSTOMER_PHONE" | sed "s/'/''/g")

IFS='|' read -r CUSTOMER_ID CUSTOMER_NAME < <(PSQL \
	"select customer_id, name from customers where phone = '$CUSTOMER_PHONE_SQL'")

if [[ -z "$CUSTOMER_ID" ]]; then
	printf '\nI don\x27t have a record for that phone number, what\x27s your name? '
	read CUSTOMER_NAME
	CUSTOMER_NAME_SQL=$(printf '%s' "$CUSTOMER_NAME" | sed "s/'/''/g")
	CUSTOMER_ID=$(PSQL_QUIET \
		"insert into customers(phone, name) values ('$CUSTOMER_PHONE_SQL', '$CUSTOMER_NAME_SQL') returning customer_id")
fi

printf '\nWhat time would you like your %s, %s?\n' "$SERVICE_NAME" "$CUSTOMER_NAME"
read SERVICE_TIME
SERVICE_TIME_SQL=$(printf '%s' "$SERVICE_TIME" | sed "s/'/''/g")


PSQL_QUIET \
	"insert into appointments(customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME_SQL')" \
	>/dev/null

printf '\nI have put you down for a %s at %s, %s.\n' "$SERVICE_NAME" "$SERVICE_TIME" "$CUSTOMER_NAME"
