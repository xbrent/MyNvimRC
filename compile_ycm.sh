echo "\033[32m install necessary packages \033[0m"
echo ""

#CLANG - Debian http://apt.llvm.org for your /etc/apt/sources.list
#deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch main
#deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch main

sudo apt-get install cppcheck flawfinder silversearcher-ag shellcheck exuberant-ctags pylint clang-format-8 clang-tools-8
sudo apt-get install libmsgpackc2 libvterm0 libtermkey1 libluajit-5.1-2 libjemalloc1

echo "\033[32m Compile ycm core \033[0m"
echo ""

mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
cd ..
rm -rf ycm_build

echo "\033[32m Cpmpile ycm regex \033[0m"
echo ""

mkdir regex_build
cd regex_build
cmake -G "Unix Makefiles" . ~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/third_party/cregex/
cmake --build . --target _regex --config Release
cd ..
rm -rf regex_build

