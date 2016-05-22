# Start dbus
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

urxvtd -q -f -o &
# Reload Xresources
xrdb -merge .Xresources
# Drop some shadows
compton -b -f --config ~/.compton.conf

[[ -f ~/.Xresources ]] && xrdb -merge  ~/.Xresources

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

exec i3
