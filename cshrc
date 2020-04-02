# $FreeBSD: releng/10.1/etc/root/dot.cshrc 243893 2012-12-05 13:56:39Z eadler $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h		history 25
alias j		jobs -l
#alias la	ls -aF
#alias lf	ls -FA
#alias ll	ls -lAF
alias ls  ls -G

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	        vim
setenv	PAGER	          less
setenv	BLOCKSIZE	      K
setenv  LSCOLORS        'Exfxcxdxbxegedabagacad'

if ($?prompt) then
	# An interactive shell -- set some stuff up
  set prompt="%{\e[30;1m%}%n%{\e[37m%} %{\e[32m%}@%{\e[37m%} %{\e[31m%}%m%{\e[37m%} %{\e[30m%}%~%{\e[37m%} %{\e[32m%}%#%{\e[37m%}""%{\e[0m%} "
  set promptchars = ">#"

	set filec
	set history = (100000 " %h %D/%W/%Y %T %R \n")
    set savehist = (100000 merge lock)
    set histdup = erase
    set autolist = ambiguous
    #alias precmd 'history -S'
    #alias postcmd 'history -M'
	# Use history to aid expansion
	set autoexpand
	set autorehash
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
	if ($term == "xterm" || $term == "vt100" \
		    || $term == "vt102" || $term !~ "con*") then
		  # bind keypad keys for console, vt100, vt102, xterm
		  bindkey "\e[1~"   beginning-of-line  # Home
		  bindkey "\e[7~"   beginning-of-line  # Home rxvt
		  bindkey "\e[2~"   overwrite-mode     # Ins
		  bindkey "\e[3~"   delete-char        # Delete
		  bindkey "\e[4~"   end-of-line        # End
		  bindkey "\e[8~"   end-of-line        # End rxvt
      bindkey "^R"      i-search-back
      bindkey '\eOc'    forward-word        # ctrl right
      bindkey '\eOd'    backward-word       # ctrl left
      bindkey '^[[1;5C' forward-word        # ctrl right
      bindkey '^[[1;5D' backward-word       # ctrl left]]]]'
	endif

endif
