#!/bin/sh

echo "\033[32m Update Plug.vim \033[0m"
echo ""

mkdir autoload

rm ./autoload/plug.vim
wget -O ./autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "\033[32m Downloading NeoVim  \033[0m"
echo ""

if  ! command -v nvim > /dev/null; then
    varName=$(echo nvim-linux64.tar.gz)
else
    varName=$(nvim --version | awk '$1=="NVIM"{print $2}')."tar.gz"
fi

echo "finding $varName"

if [ ! -f "./$varName" ]; then
    wget -O "$varName" https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
else
    echo "\033[32m File '$varName' Already Exist. \033[0m"
fi

tar xzvf "$varName"
rm -rf ./bin ./share

mv ./nvim-linux64/bin ./
mv ./nvim-linux64/share ./
rm -rf ./nvim-linux64
rm "$varName"
