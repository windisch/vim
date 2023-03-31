# My VIM setup

This is my personal and individualized VIM setup. The main purpose of
this repository is self-documentation, but feel free to use my
configuration as starting point for yours!

## Requirements

### VIM
An installed version of VIM in version `>=8.0` that is compiled with at
least the following options is required:

```
 --enable-multibyte 
 --enable-perlinterp=dynamic
 --enable-rubyinterp=dynamic
 --enable-pythoninterp=yes
 --enable-python3interp=yes
 --enable-luainterp
 --with-luajit
 --enable-cscope
 --enable-gui=auto
 --with-features=huge
 --with-x
 --enable-fontset
 --enable-largefile
 --disable-netbeans
```

### Python

To effiently write and edit python code, the VIM plugin
[pymode](https://github.com/python-mode/) is used. Here are some of my
most frequently used shortcuts:

* `<leader>b`: Set a `pdb` break point
* `<leader>h`: Show docstring
* `<leader>d`: Go to definition
* `<leader>g`: Go to first assignment

Pytest shortcuts

* `<leader>f`: Run pytest for file
* `<leader>c`: Run pytest for class
* `<leader>m`: Run pytest for method
* `<leader>p`: Run pytest for method with breakpoint somewhere

### Latex
If you want to edit and compile latex code, make sure that `pdflatex`
is installed.

## Installation
The safest way to install this VIM configuration is by using
my ansible role [here](https://github.com/windisch/ansible-role-vim),
which takes care of the installation of all requirements, 
the build of VIM from the sources, and some other things that I find
useful.

Without ansible, you can clone the repository with

```
git clone --recursive https://github.com/windisch/vim.git ~/.vim
```
As all plugins are included via submodules in git, do not forget to
add `--recursive`. I also provided my `vimrc`, if you want to use
it, run 

```
ln -s ~/.vim/vimrc ~/.vimrc
```

Finally, the plugin `command-t` has to be build. To do so, run the
following command in the directory
`~/.vim/bundle/command-t/ruby/command-t/ext/command-t`

```
ruby extconf.rb && make
```

### Languagetool

To enable grammar checking (with `:LanguageToolCheck`), the
[LanguageTool](http://www.languagetool.org/) needs to be installed
with:

```bash
wget https://languagetool.org/download/LanguageTool-5.2.zip
unzip LanguageTool-5.2.zip
mv LanguageTool-5.2 ~./languagetool
```
