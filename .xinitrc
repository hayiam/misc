xrdb -merge ~/.Xresources
exec dbus-launch --exit-with-session dwm
exec killall dwm
exec dbus-launch --exit-with-session dwm
