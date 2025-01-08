#!/usr/bin/

# Author: { @Override } | 1/7/2025 ; 19:14

function create() {
    echo "Running Script...\n"
    ocaml gittua ./src/gittua/spitonthatthang/gittua.ml
    echo "Created file!\n"
    sudo mv ./src/gittua/spitonthatthang/gittua /usr/local/bin/
    echo "Moved File!\n"
}
create
echo "File has been created! Would you like to run?"
read answer

case "$answer" in 
    "y") chmod +x /usr/local/bin/gittua 
    *) echo "get fucked :p"
esac
