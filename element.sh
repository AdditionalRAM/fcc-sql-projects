#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



if [[ -z $1 ]]
then echo -e "Please provide an element as an argument."
else
if [[ $1 =~ ^[0-9]+$ ]]
then
INFO=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
fi
if [[ -z $INFO ]]
then
  INFO=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1'")
fi
if [[ -z $INFO ]]
then
  INFO=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$1'")
fi
if [[ -z $INFO ]]
then 
echo "I could not find that element in the database."
exit
fi
# pipe into while and spit out data
echo $INFO | while IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELT BOIL TYPE
do echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done 
fi