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
wait

focus
echo "First, we'll download some prerequisites (nodejs)..."
echo
curl -O $NODE_URL

focus
echo "We've downloaded everything we need!"
echo
echo "Now let's install the mobile-center command."
wait

focus
echo "Please type your account password (used to unlock your Mac):"
echo
sudo echo "Installing nodejs..."
sudo installer -verboseR -pkg $NODE_PKG -target / > /dev/null
rm -rf $NODE_PKG

echo "Installing mobile-center command line tool..."
sudo npm install -g --loglevel silent mobile-center-cli > /dev/null

focus
echo "Great! Everything is installed. Let's get you logged into Mobile Center"
echo
echo "$ mobile-center login"
echo
mobile-center login

focus
echo "You're all logged in! Let's see which apps you have:"
echo
echo "$ mobile-center apps list"
echo
mobile-center apps list