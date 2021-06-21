cd && git clone https://stuartJayRaj@bitbucket.org/mindkraft-public/mindkraft-resources.git
mkdir -p ~/.config/nvim 
ln -s ~/mindkraft-resources/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
sudo apt install neovim  
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo apt install zsh && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install python3 
pip3 install visidata 
echo 'alias vim=nvim'>> ~/.zshrc
source ~/.zshrc





