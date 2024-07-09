#!/bin/bash
PSQL="psql -t -A -q --username=freecodecamp --dbname=salon -c"

echo -e "\n~~ Barbarian Cut ~~\n"

MAIN_MENU() {
  if [[ -n $1 ]]
  then 
    echo -e "\n$1\n"
  fi
  # show services
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while IFS='|' read -r SERVICE_ID SERVICE_NAME DESCRIPTION PRICE
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME: $DESCRIPTION\nPrice: \$$PRICE"
  done
  echo -e "\nWhich one would you like to book?"
  read SERVICE_ID_SELECTED
  # check if selected service is a valid ID number
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SELECTED_SERVICE ]]
    then MAIN_MENU "Sorry, that is not a valid service we currently offer."
    fi
    # check if customer and stuff
    echo "Please enter your phone number."
    read CUSTOMER_PHONE
    # check if already customer
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo "It looks like you're a first time customer. What's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      echo -e "I've registered you as a customer, $CUSTOMER_NAME.\n"
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    echo "What time would you like your appointment?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo "I have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    echo "See you at $SERVICE_TIME!"

  else MAIN_MENU "Sorry, that is not a valid service we currently offer."
  fi
}


MAIN_MENU "Services we offer:"