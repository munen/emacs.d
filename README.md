## Installation

This Emacs installation is managed via [Cask](http://cask.readthedocs.org/).

**Mac**
`brew install cask`

**General**
`git clone git@github.com:munen/emacs.d.git ~/.emacs.d`
`cd ~/.emacs.d`
`cask install`

## Clojure

* `M-x cider-jack-in` To start REPL
* `C-c C-k` Evaluate current buffer
* `C-c M-n` Change ns in cider-nrepl to current ns
* `C-c C-d C-d` Display documentation for the symbol under point
* `C-c C-d C-a` Apropos search for arbitrary text across function names and documentation


## Impatient Mode - Live Coding Emacs/Browser

https://github.com/netguy204/imp.el

Enable the web server provided by simple-httpd:

    M-x httpd-start

Publish buffers by enabling the minor mode impatient-mode.

    M-x impatient-mode

And then point your browser to http://localhost:8080/imp/, select a buffer, and watch your changes appear as you type!

** CIDER Buffer Key Bindings **

* `C-↑, C-↓` Cycle through REPL history.
