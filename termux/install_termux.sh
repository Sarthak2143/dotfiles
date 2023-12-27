echo "[+] Updating packages..."
apt update; apt upgrade
echo "[+] Installing packages..."
apt install wget python3 git openssh vim tree -y
echo "[+] Downloading dotfiles..."
git clone https://github.com/Sarthak2143/dotfiles
termux-setup-storage
cd dotfiles/
cd src
cd termux
mv .bashrc ~/
mv * ~/.termux/
cd ..
cd vim
mv .vimrc ~/
cd ..
cd shell
cd bash
mv .bash_aliases ~/
cd ..
cd fish
mv * ~/.config/fish -r
cd
echo "[+] Setting up vim..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "[+] Setting up ssh for ubuntu..."
passwd
vim +PluginInstall +qall
echo "[+] Setting up git..."
git config --global user.name "Sarthak Tomar"
git config --global user.email "sarthaktomar2143@gmail.com"
git config --global init.defaultBranch main
git config --global color.ui auto
ssh-keygen -t ed25519 -C sarthaktomar2143@gmail.com
cat ~/.ssh/id_ed25519.pub
echo "Use the above key for ssh and login into git."
echo "Installation complete."
