#!/usr/bin/env bash

[[ -d ~/.emacs.d/layers/+TheBB ]] || \
    git clone git@github.com:TheBB/spacemacs-layers.git ~/.emacs.d/layers/+TheBB
[[ -d ~/.emacs.d/layers/+aaron ]] || \
    git clone git@github.com:aaronjensen/spacemacs.d.git ~/.emacs.d/layers/+aaron

# Disable app nap for emacs so it doesn't cause terrible difficult to track down
# things to happen https://github.com/syl20bnr/spacemacs/issues/5413
defaults write org.gnu.Emacs NSAppSleepDisabled -bool YES
