{ config, pkgs, ...}:

{
    programs.tmux = {
      enable = true;
      enableFzf = true;
      enableSensible = true;
      enableVim = true;
      extraConfig = ''
        bind-key r source-file ${config.xdg.configHome}/tmux/tmux.conf \; display-message "~/.tmux.conf reloaded."

        unbind C-b
        set-option -g prefix C-a
        bind C-a send-prefix

        # vim-like pane switching
        bind -r ^ last-window
        bind -r k select-pane -U
        bind -r j select-pane -D
        bind -r h select-pane -L
        bind -r l select-pane -R

        # pane splitting
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -c "#{pane_current_path}"

        bind > swap-pane -D
        bind < swap-pane -U

        bind C command-prompt -p "Window-Name: " "new-window -n '%%'"
        bind Tab last-window

        set -g base-index 1           # start windows numbering at 1
        setw -g pane-base-index 1     # make pane numbering consistent with windows
        setw -g automatic-rename on # rename window to reflect current program
        set -g renumber-windows on    # renumber windows when a window is closed

        # Undercurl
        set -g default-terminal "''\${TERM}"
        set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
        set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

        # Enable vim like copy from terminal
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'pbcopy'
      '';
    };
}