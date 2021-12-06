# Sets up up Vivaldi for apt
# needed to be run as sudo


[ "$UID" -eq 0 ] || exec pkexec bash "$0" "$@"

wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg

echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list

 apt update && apt install vivaldi-stable