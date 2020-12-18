#bin/
echo "Installing Homebrew"
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

echo "Installing Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Running the command to create the locate database at (/var/db/locate.database)"
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
sudo /usr/libexec/locate.updatedb

echo "Installing all homebrew packages"
while read p; do
        echo "Installing $p"
        brew install "$p"
        echo "Done installing $p"
done <brew-packages.txt
