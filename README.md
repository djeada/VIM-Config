# VIM
This repository contains my personalized VIM configuration, including plugins and settings.

## Installation

Clone the repository to your local machine:

```
git clone https://github.com/djeada/VIM-Config.git
```

Copy the `.vimrc` file to your home directory:

```
cp VIM-Config/.vimrc ~/.vimrc
```

## Installing plugins with vim-plug

Open the terminal and run the following command:

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Add following text to your ~/.vimrc file:

```vim
call plug#begin()
Plug '-HERE-GOES-PLUGIN-NAME'
call plug#end()
```
Then open any file with VIM and run the following command:

```vim
:PlugInstall
```
## Customizations
You can make customizations by editing the ~/.vimrc file.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
