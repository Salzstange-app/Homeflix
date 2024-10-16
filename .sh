#!/bin/bash

HOSTS="localhost"
PLAYBOOK="galaxy.yaml"
# Farben definieren
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # Keine Farbe

# Installiere Python mit Pipx
echo -e "${BLUE}Installing Python3, Pip3, and Pipx...${NC}"
sudo apt install -y python3 python3-pip pipx

# Versionen abrufen
python3Version=$(python3 --version)
pip3Version=$(pip3 --version)
pipxVersion=$(pipx --version)

# Installiere Ansible
echo -e "${BLUE}Installing Ansible via Pipx...${NC}"
sudo pipx install --include-deps ansible

# Ausgabe
echo -e "${GREEN}"
echo "==========================================================="
echo -e "${YELLOW}Installation Complete:${NC}"
echo -e "Python3 Version: ${GREEN}$python3Version${NC}"
echo -e "Pip3 Version: ${GREEN}$pip3Version${NC}"
echo -e "Pipx Version: ${GREEN}$pipxVersion${NC}"
echo "==========================================================="
echo -e "${NC}" # Zurück zu normalem Text

sudo ansible-playbook $PLAYBOOK &
    # Warte, bis das Playbook abgeschlossen ist
    wait $!
    echo "Ansible Playbook abgeschlossen!"