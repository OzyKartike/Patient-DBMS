#!/bin/sh
MainMenu() 
{
    CHOICE=""
    Pause=""
    while [ "$CHOICE" != "E" ]; do
        clear
        echo "============================================================="
        echo "| Oracle All Inclusive Tool"
        echo "| Main Menu - Select Desired Operation(s):"
        echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>"
        echo "-------------------------------------------------------------"
        echo " M) View Manual"
        echo " 1) Drop Tables"
        echo " 2) Create Tables"
        echo " 3) Populate Tables"
        echo " 4) Query Tables"
        echo " X) Force/Stop/Kill Oracle DB"
        echo " E) End/Exit"
        echo "Choose: "
        read CHOICE
        case "$CHOICE" in
            "M")
                echo "View Manual"
                ;;
            "1")
                bash drop_tables.sh
                ;;
            "2")
                bash create_tables.sh
                ;;
            "3")
                bash populate_tables.sh
                ;;
            "4")
                bash queries.sh
                ;;
            "X")
                echo "Force/Stop/Kill Oracle DB"
                ;;
            "E")
                echo "Exiting..."
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
        echo "Press any Enter to continue"
        read Pause
    done
}

ProgramStart() 
{
    MainMenu
}

ProgramStart