set -Ux LANG en_US.UTF-8
set -gx TERM xterm-256color
set -Ux LANGUAGE en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8

set encoding UTF-8
# set -Ux LANG ko_KR.UTF-8
# set -Ux LC_ALL ko_KR.UTF-8
# set -Ux LANGUAGE ko_KR.UTF-8
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
# # theme
# # set -g fish_prompt_pwd_dir_length 1
# # set -g theme_display_user yes
# # set -g theme_hide_hostname no
# # set -g theme_hostname always

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# # Fish syntax highlighting
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline
#
# set -g fish_key_bindings fish_default_key_bindings
set -g fish_key_bindings fish_user_key_bindings
set -g fish_key_bindings fish_vi_key_bindings
# set fish_bind_mode insert

function fish_greeting
    echo Hello Opal
    echo "Welcome to fish, the friendly interactive shell"
end

set -U fish_greeting

# aliases
alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"
alias ls "ls -p -G"
# alias ls "gls --color"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias lg=lazygit
alias g git
alias python=python3
alias pip=pip3
command -qv nvim && alias vim nvim
#
set -gx EDITOR nvim
#
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
#
# # NodeJS
set -gx PATH node_modules/.bin $PATH
set -x PATH $HOME/.scripts $PATH
#
# # Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
#
# set -gx NVM_DIR (brew --prefix nvm)
# # # ~/.config/fish/config.fish

# function nvm
#     bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
# end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end
#
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end


# Pvenv
pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source

# Direnv
direnv hook fish | source

# initialize starship
starship init fish | source

# Uninstall starship
# sh -c 'rm "$(command -v 'starship')"'

# ~/.local/bin/mise activate fish | source
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
