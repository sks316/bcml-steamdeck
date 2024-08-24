#!/bin/bash

#  BCML Installer for Steam Deck  #
#  By PrincessLillie, aka sks316  #
#   IT'S DANGEROUS TO GO ALONE!   #

# This file is normally downloaded and executed by Install_BCML.desktop
# If you do not know what to do, try downloading the .desktop file from the link below
# https://github.com/sks316/bcml-steamdeck/releases/latest

if zenity --question --title "Install BCML?" --text="This will install BCML to your system. Are you sure?" --width=300; then # Show Zenity dialog to ask user if they want to install BCML
    (
    if test -f ~/bcml_installer.log &> /dev/null # Test if a previous installation log exists
    then
        rm ~/bcml_installer.log # Delete the previous installation log if it exists
    else
        :
    fi
    if test -f ~/miniconda3/condabin/conda &> /dev/null # Test if Miniconda exists on system
    then
        echo "conda init"
        echo "10"
        ~/miniconda3/condabin/conda init >> ~/bcml_installer.log 2>&1 # Initialize Miniconda, in case the user has not already done so
        if [[ $? -eq 0 ]]; then
            :
        else
            echo "100"
            zenity --error --title="Error occurred!" --text="`printf "An error occurred in this command: conda init\nPlease file a bug report at https://github.com/sks316/bcml-steamdeck/issues and upload the bcml_installer.log file stored in your home directory!"`" --width=400 # Show Zenity error if program has a non-zero exit code, then quit
            exit
        fi
        echo "# conda install -c conda-forge gcc -y"
        echo "20"
        ~/miniconda3/condabin/conda install -c conda-forge gcc -y >> ~/bcml_installer.log 2>&1 # Install GCC from conda-forge, which is required to compile some BCML dependencies
        if [[ $? -eq 0 ]]; then
            :
        else
            echo "100"
            zenity --error --title="Error occurred!" --text="`printf "An error occurred in this command: conda install -c conda-forge gcc -y\nPlease file a bug report at https://github.com/sks316/bcml-steamdeck/issues and upload the bcml_installer.log file stored in your home directory!"`" --width=400 # Show Zenity error if program has a non-zero exit code, then quit
            exit
        fi
        echo "# conda install pip -y"
        echo "30"
        ~/miniconda3/condabin/conda install pip -y >> ~/bcml_installer.log 2>&1 # Install pip, the Python package manager, from conda repos
        if [[ $? -eq 0 ]]; then
            :
        else
            echo "100"
            zenity --error --title="Error occurred!" --text="`printf "An error occurred in this command: conda install pip -y\nPlease file a bug report at https://github.com/sks316/bcml-steamdeck/issues and upload the bcml_installer.log file stored in your home directory!"`" --width=400 # Show Zenity error if program has a non-zero exit code, then quit
            exit
        fi
        echo "# python -m pip install bcml"
        echo "50"
        ~/miniconda3/bin/python -m pip install bcml >> ~/bcml_installer.log 2>&1 # Finally install BCML via pip
        if [[ $? -eq 0 ]]; then
            :
        else
            echo "100"
            zenity --error --title="Error occurred!" --text="`printf "An error occurred in this command: python -m pip install bcml\nPlease file a bug report at https://github.com/sks316/bcml-steamdeck/issues and upload the bcml_installer.log file stored in your home directory!"`" --width=400 # Show Zenity error if program has a non-zero exit code, then quit
            exit
        fi
        echo "# Adding icons..."
        echo "75"
        mkdir ~/.icons >> ~/bcml_installer.log 2>&1 # Make directory for BCML icon, with default settings this is hidden in the file browser
        wget https://github.com/sks316/bcml-steamdeck/raw/main/bcml.png -O ~/.icons/bcml.png >> ~/bcml_installer.log 2>&1 # Download icon file from my GitHub repo
        wget https://github.com/sks316/bcml-steamdeck/raw/main/BCML.desktop -O ~/Desktop/BCML.desktop >> ~/bcml_installer.log 2>&1 # Download .desktop launcher file from my GitHub repo
        chmod +x ~/Desktop/BCML.desktop >> ~/bcml_installer.log 2>&1 # Make BCML.desktop executable
        cp ~/Desktop/BCML.desktop ~/.local/share/applications/BCML.desktop >> ~/bcml_installer.log 2>&1 # Copy .desktop launcher file to application launcher
        echo "100"
        zenity --info --title="BCML installed successfully!" --text="BCML is now installed. You can access it with the icon on your desktop, or through your application launcher." --width=300 # Show Zenity dialog for installation success
    else
        echo "100"
        zenity --error --title="Miniconda missing!" --text="Miniconda is missing. Please install Miniconda with Python 3.8, then run this script again." --width=300 # Show Zenity error if Miniconda is missing
        exit
    fi
    ) |
    zenity --progress --title="Installing BCML" --text="Squadala! We are off!" --percentage=0 --width=300 --auto-close # Show Zenity progress bar
else
    exit
fi
exit