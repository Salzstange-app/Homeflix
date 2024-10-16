#!/bin/bash

# Pfade zu Ansible-Inventar und Playbook
HOSTS="localhost"
PLAYBOOK="galaxy.yaml"

# Überprüfe, ob Ansible installiert ist
if ! command -v ansible-playbook &> /dev/null
then
    sudo bash .sh
fi

# Ladebildschirm-Funktion
loading_screen() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    echo -n "Laden "
    while ps -p $pid > /dev/null 2>&1; do
        for i in $(seq 0 3); do
            printf "\b${spinstr:i:1}"
            sleep $delay
        done
    done
    printf "\b" # Rückwärts löschen
    echo "Fertig!"
}

# Ansible-Playbook ausführen und Ladebildschirm anzeigen
sudo ansible-playbook $PLAYBOOK &

# Zeige den Ladebildschirm an, während das Playbook ausgeführt wird
loading_screen

# Warte, bis das Playbook abgeschlossen ist
wait $!
echo "Ansible Playbook abgeschlossen!"
