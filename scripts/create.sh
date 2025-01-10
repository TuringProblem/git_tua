#!/bin/zsh
# if you are linux use : #!/usr/bin/

# Author: { @Override } | 1/7/2025 ; 19:14

function isInstalled() {
    if ! command -V ocamlopt &> /dev/null
    then
        echo "Ocaml is not installed. Please click https://ocaml.org/docs/installing-ocaml\n"
        echo "Would you like to download?"
        read answer
        # TODO: NEED TO FINISH THE LOGIC FOR THIS -> if yes, check: Mac, Linux, Windows -> download for respective OS. @ 1/8/25 16;00
        if [ $answer -eq "y"]; then
            echo "are you on mac, windows, or linux:"
        fi
        exit 1
    fi
}

isInstalled
DIR=$(dirname "$(realpath "$0")")
cd "$DIR" || exit 1
if [ $? -ne 0 ]; then
    echo "Error: Compilation failed.\n"
    exit 1
fi

echo "Now Installing GitTUA globally..."
sudo mv gittua /usr/local/bin/gittua

if [ $? -ne 0 ]; then
    echo "GitTUA has been successfully installed\nRun gittua to SPIT ON THAT THANG! :)"
else
    echo "Error installing GitTUA"
    exit 1
fi
