# Key Binding
## General Rules
- leader x 2, bind to execute command
- some very convient used function bind to level 1 key directly
- some of level 1 key bind to prefix
- some level 2 key bind to convinent used function
## level 1 prefix key category
- t, toggle
- f, file
- p, project
- x, tool
- b, buffer
- w, window
# Solved Issues
# #1 Emacs tip show with white fg and yellow bg, not clear
*Issues*
- os: macOS Mojave 10.14.4

*Solved*:
- run command line `defaults write org.gnu.Emacs NSRequiresAquaSystemAppearance true`
- run `defaults delete org.gnu.Emacs NSRequiresAquaSystemAppearance` to back out change

*Reference*
- https://github.com/syl20bnr/spacemacs/issues/11541
