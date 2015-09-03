To install a vim plugin, follow the instructions for Pathogen.

Add the plugin:

```
$ cd bundle
$ git clone https://github.com/scrooloose/nerdtree
```

Add the plugin to ../.gitmodules:

```
[submodule "nerdtree"]
        path = vim/bundle/nerdtree
        url = https://github.com/scrooloose/nerdtree
        ignore = dirty
```

[Pathogen Doc](https://github.com/tpope/vim-pathogen)
