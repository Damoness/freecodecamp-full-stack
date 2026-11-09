#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

element=$(psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only --quiet --set=ON_ERROR_STOP=1 --set="input=$1" <<'SQL'
  SELECT 'The element with atomic number ' || e.atomic_number || ' is ' || e.name ||
    ' (' || e.symbol || '). It''s a ' || t.type || ', with a mass of ' || p.atomic_mass ||
    ' amu. ' || e.name || ' has a melting point of ' || p.melting_point_celsius ||
    ' celsius and a boiling point of ' || p.boiling_point_celsius || ' celsius.'
  FROM elements AS e
  JOIN properties AS p USING (atomic_number)
  JOIN types AS t USING (type_id)
  WHERE e.atomic_number::text = :'input'
    OR e.symbol = :'input'
    OR e.name = :'input';
SQL
)

if [[ -z "$element" ]]; then
  echo "I could not find that element in the database."
else
  echo "$element"
fi
