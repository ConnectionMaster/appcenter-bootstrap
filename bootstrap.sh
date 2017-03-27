NODE_URL=https://nodejs.org/dist/v6.10.0/node-v6.10.0.pkg
NODE_PKG=$(basename $NODE_URL)

function focus {
clear
echo "███╗   ███╗ ██████╗ ██████╗ ██╗██╗     ███████╗    "
echo "████╗ ████║██╔═══██╗██╔══██╗██║██║     ██╔════╝    "
echo "██╔████╔██║██║   ██║██████╔╝██║██║     █████╗      "
echo "██║╚██╔╝██║██║   ██║██╔══██╗██║██║     ██╔══╝      "
echo "██║ ╚═╝ ██║╚██████╔╝██████╔╝██║███████╗███████╗    "
echo "╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚══════╝╚══════╝    "
echo "                                                   "
echo " ██████╗███████╗███╗   ██╗████████╗███████╗██████╗ "
echo "██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗"
echo "██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝"
echo "██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗"
echo "╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║"
echo " ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
echo
echo
echo
}

function wait {
    echo
    read -rsp $'Press any key to continue...' -n1 key
}

focus
echo "Hello!"
echo
echo "Let's install everything you need to use Mobile Center."
echo
echo "Please type your account password (used to unlock your Mac):"
echo
sudo echo

download_node() {
    focus
    echo "First, we'll download some prerequisites (nodejs)..."
    echo
    curl -O $NODE_URL
}

install_node() {
    echo "Installing nodejs..."
    sudo installer -verboseR -pkg $NODE_PKG -target / > /dev/null
    rm -rf $NODE_PKG
}

install_npm_deps() {
    focus
    echo "Initializing mobile-center command line tool..."
    sudo npm install -g --silent --progress=false mobile-center-bootstrap > /dev/null
}

if hash node 2>/dev/null; then
    echo
else
    download_node
    install_node
fi

install_npm_deps

focus
mobile-center-bootstrap