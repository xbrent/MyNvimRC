echo "\033[32m install necessary packages \033[0m"
echo ""


sudo apt-get install cppcheck flawfinder silversearcher-ag shellcheck exuberant-ctags pylint clang-format-8 clang-tools-8

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

