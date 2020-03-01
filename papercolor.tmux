#==============================================================================
# Colorscheme
#------------------------------------------------------------------------------
# Author:  Erik Schreier
# Version: 1.2 (Feb. 16 2019)
# Path:    ~/.tmux/.tmux.conf.surface
#------------------------------------------------------------------------------
# Changes in 1.1:
# + comments for better documentation
# + color correction:
#   ~ passive window now uses orange(208) instead of yellow(218)
#------------------------------------------------------------------------------
# Changes in 1.2:
# + added powerline style for statusbar
# ! REQUIRE: powerline patched fonts
#==============================================================================
# separator characters

main() {
  tmux set-option -g default-shell /usr/bin/zsh

  ArRt=""
  ArLt=""

  # separators left side
  #
  LbLt="#[fg=colour236,bg=colour254]"${ArRt}""
  OmLs="#[fg=colour254,bg=colour208]"${ArRt}""
  OmRs="#[fg=colour208,bg=colour254]"${ArRt}""
  GmLs="#[fg=colour254,bg=colour148]"${ArRt}""
  GmRs="#[fg=colour148,bg=colour254]"${ArRt}""
  AqLs="#[fg=colour254,bg=colour037]"${ArRt}""
  AqRs="#[fg=colour037,bg=colour254]"${ArRt}""

  # separators right side
  #
  LbRt="#[fg=colour236,bg=colour254]"${ArLt}""
  YmLs="#[fg=colour214,bg=colour236]"${ArLt}""
  YmRs="#[fg=colour254,bg=colour214]"${ArLt}""
  PmLs="#[fg=colour205,bg=colour236]"${ArLt}""
  PmRs="#[fg=colour254,bg=colour205]"${ArLt}""

  # colors for marker labels (colored bg, black fg)
  #
  MkOr="#[fg=colour254,bg=colour208,bold]"
  MkGn="#[fg=colour254,bg=colour148,bold]"
  MkYe="#[fg=colour254,bg=colour214,bold]"
  MkBl="#[fg=colour254,bg=colour074,bold]"
  MkPu="#[fg=colour254,bg=colour205,bold]"
  MkAq="#[fg=colour254,bg=colour037,bold]"

  # colors for status labels (colored fg, black bg)
  #
  LbOr="#[fg=colour244,bg=colour254,nobold]"
  LbGn="#[fg=colour162,bg=colour254,nobold]"
  LbYe="#[fg=colour214,bg=colour236,nobold]"
  LbBl="#[fg=colour074,bg=colour236,nobold]"
  LbPu="#[fg=colour205,bg=colour236,nobold]"
  LbAq="#[fg=colour037,bg=colour236,nobold]"

  # left side of the statusbar
  #
  StLt=""${AqLs}"$MkAq #S $AqRs"                            # session name
  WnSC=""${GmLs}"$MkGn #I $GmRs$LbGn #W "            # active window
  WnSt=""${OmLs}"$MkOr #I $OmRs$LbOr #W "            # passive window

  # right side of the statusbar
  #
  DtTm=""${LbRt}"$LbYe %a %-d. %B %Y $YmLs$MkYe %H:%M $YmRs" # date     | time
  HsWh=""${LbRt}"$LbPu #h $PmLs$MkPu #(whoami) $PmRs"       # hostname | username
  StRt=""${DtTm}"$HsWh"                                     # build right side

  # statusbar settings
  #
  tmux set -g pane-active-border-bg colour254                # we dont want to see
  tmux set -g pane-active-border-fg colour148                # border for splits a
  tmux set -g pane-border-bg default                         # we dont want to see
  tmux set -g pane-border-fg colour214                       # border for splits p
  tmux set -g message-fg colour148                           # messagebar fg
  tmux set -g message-bg colour254                           # messagebar bg
  tmux set -g status-justify left                            # place window list left
  tmux set -g status-bg colour254                            # statusbar itself
  tmux set -g status-fg colour254                            # statusbar itself

  # print left side of the statusbar
  #
  tmux setw -g status-left-length 10                         # max len of sessionname
  tmux setw -g status-left "${StLt}"                             # sessionname
  tmux setw -g window-status-separator ""                    # space between windows
  tmux setw -g window-status-current-format "${WnSC}"            # active window status
  tmux setw -g window-status-format "${WnSt}"                    # passive windows status

  # print right side of the statusbar
  #
  tmux set -g status-right-length 100                        # max len of the info
  tmux set -g status-right "${StRt}"                             # date|time - host|user
}

main
