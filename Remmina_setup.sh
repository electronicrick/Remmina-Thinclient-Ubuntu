#!/bin/bash

# Dit script kan oneindig keren worden uitgevoerd doordat dit script de vorige instellingen overschrijft
# als er dus iets niet goed gaat kun je dit script nog een keer starten en alles corrigeren

#installeerd remmina
sudo apt install remmina
# maakt de map /remmina aan
sudo mkdir /remmina
echo Remmina start over 12 seconden op en stel dan Remmina in met de gewenste RDP connectie en preferences. sluit Remmina met ctrl+q of druk in het menu op quit om de instellingen op te slaan. voor de gewenste instellingen zie de handleiding. Als het niet verder lijkt te gaan na het sluiten van Remmina druk dan op control+C.
sleep 12
remmina

# Kopiëerd de RDP connectie file
sudo cp /root/.local/share/remmina/*.remmina /remmina/RDP.remmina

# maakt de bash file aan voor Remmina en stelt de juiste permissies in
sudo echo "#!/bin/bash" > /remmina/remmina.sh
# /remmina/RDP.remmina word automatisch aangemaakt door het kopiëeren van de connectie file
sudo echo "remmina --kiosk --connect=/remmina/RDP.remmina" >> /remmina/remmina.sh


sudo chmod 755 /remmina/remmina.sh
sudo chmod 755 /remmina
echo hierna worden de hotkeys uitgeschakeld doormiddel van een startup proggramma en de remmina kiosk mode wordt aangemaakt startup proggramma
sudo chmod +x /remmina/remmina.sh
sudo mkdir /etc/skel/.config
sudo mkdir /etc/skel/.config/autostart

# Autostart config/autostart/Remmina
sudo echo "[Desktop Entry]" > /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Type=Application" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Exec=/remmina/remmina.sh" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Hidden=false" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "NoDisplay=false" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "X-GNOME-autostart-enabled=true" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Name[en_US]=Remmina" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Name=Remmina" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Comment[en_US]=" >> /etc/skel/.config/autostart/remmina.sh.desktop
sudo echo "Comment=" >> /etc/skel/.config/autostart/remmina.sh.desktop

# Autostart config/autostart/disable-hotkeys
sudo echo "[Desktop Entry]" > /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Type=Application" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Exec=/remmina/disable-hotkeys.sh" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Hidden=false" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "NoDisplay=false" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "X-GNOME-autostart-enabled=true" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Name[en_US]=disable-hotkeys" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Name=disable-hotkeys" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Comment[en_US]=" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop
sudo echo "Comment=" >> /etc/skel/.config/autostart/disable-hotkeys.sh.desktop

# maakt de Bash script aan met de juiste permissies
sudo echo "#!/bin/bash" > /remmina/disable-hotkeys.sh
sudo chmod +x /remmina/disable-hotkeys.sh
sudo chmod 755 /remmina/disable-hotkeys.sh

# lockdown van het systeem
# Deze commando's hoeven niet tijdens iedere start uitgevoerd te worden omdat dit systeem wijd is
sudo gsettings set org.gnome.desktop.lockdown mount-removable-storage-devices-as-read-only true
sudo gsettings set org.gnome.desktop.lockdown disable-save-to-disk true
sudo gsettings set org.gnome.desktop.lockdown disable-printing true
sudo gsettings set org.gnome.desktop.lockdown disable-print-setup true
sudo gsettings set org.gnome.desktop.lockdown user-administration-disabled true
sudo gsettings set org.gnome.desktop.privacy usb-protection true

# Uitzetten van alle hotkeys
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-2 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-3 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-4 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-5 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-6 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-7 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-8 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-9 ['']" >> /remmina/disable-hotkeys.sh
echo op 25%
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-2 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-3 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-4 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-5 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-6 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-7 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-8 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-9 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.extensions.dash-to-dock minimize-shift false" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys terminal ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings open-application-menu ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-2 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-3 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-4 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-5 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-6 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-7 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-8 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings switch-to-application-9 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings toggle-application-view ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings focus-active-notification ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys help ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot-clip ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot-clip ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys screencast ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.settings-daemon.plugins.media-keys www ['']" >> /remmina/disable-hotkeys.sh
echo op 50%
sudo echo "gsettings set org.gnome.desktop.wm.keybindings activate-window-menu ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings begin-move ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings begin-move ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings close ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-group ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-panels ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-windows ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings maximize ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings minimize ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings panel-main-menu ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings show-desktop ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-applications ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-input-source ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-panels ['']" >> /remmina/disable-hotkeys.sh
echo op 75%
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-windows ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings unmaximize ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings toggle-overview ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.shell.keybindings toggle-message-tray ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings begin-resize ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings toggle-maximized ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-group ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.desktop.wm.keybindings switch-group-backward ['']" >> /remmina/disable-hotkeys.sh
sudo echo "gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts ['']" >> /remmina/disable-hotkeys.sh

# Hierna word de configuratie van Remmina gekopiëerd naar de /etc/skel directory
sudo cp -r ~/.config/remmina /etc/skel/.config/remmina
echo Script voltooid