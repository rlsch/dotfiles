# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

download_plugins () {
  git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
}
