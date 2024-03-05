#!/usr/bin/env bash

# Define a variável que aponta para o arquivo que armazenará os contatos
CONTACT_FILE="./src/contact.txt"

# Define a function to add a contact
add_contact() {
    echo "Name: "
    read name
    echo "Email: "
    read email
    echo "Phone: "
    read phone

    echo "$name;$email;$phone" >> $CONTACT_FILE
}

# Define a function to remove a contact
remove_contact(){
    echo "Remove using name, email or phone? (n/e/p)"
    read option

    if [ "$option" == "n" ]; then
        echo "Name: "
        read name
        sed -i "/$name/d" $CONTACT_FILE
    elif [ "$option" == "e" ]; then
        echo "Email: "
        read email
        sed -i "/$email/d" $CONTACT_FILE
    elif [ "$option" == "p" ]; then
        echo "Phone: "
        read phone
        sed -i "/$phone/d" $CONTACT_FILE
    else
        echo "Invalid Option!"
    fi
}

# Define a function to list contacts
list_contacts(){
    echo "Contacts: "
    while IFS= read -r line
    do
        echo $line
    done < $CONTACT_FILE
}

# Main Menu
while true; do
    echo "Menu:"
    echo "1. Add Contact"
    echo "2. Remove Contact"
    echo "3. List Contact"
    echo "4. Exit"

    read option

    case $option in
        1) add_contact ;;
        2) remove_contact ;;
        3) list_contacts ;;
        4) break ;;
        *) echo "Invalid Option!" ;;
    esac
done


