#!/bin/bash
cd
if [ -e "/data/data/com.termux/files/home/storage" ]; then
	rm -rf /data/data/com.termux/files/home/storage
fi
termux-setup-storage
yes | pkg update
. <(curl https://cdn.quanghuynopro.com/store/termux-change-repo.sh)
yes | pkg upgrade
yes | pkg i python
yes | pkg i python-pip
yes | pkg i git xdelta3 wget tsu

wget -O ~/NXMC_INSTALLER https://github.com/NXMC-samehwid/Public/releases/download/base-release/installer
chmod +x ~/NXMC_INSTALLER
sudo $(realpath ~/NXMC_INSTALLER)
mkdir -p ~/.termux/boot && echo -e '#!/data/data/com.termux/files/usr/bin/bash\nif ! pgrep -f start_nxmc.sh > /dev/null; then\n  su -c '\''export PATH=$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && /data/NXMC/start_nxmc.sh'\''\nfi' > ~/.termux/boot/start_nxmc.sh && chmod +x ~/.termux/boot/start_nxmc.sh && grep -q start_nxmc.sh ~/.bashrc || echo "if ! pgrep -f start_nxmc.sh > /dev/null; then su -c 'export PATH=\$PATH:/data/data/com.termux/files/usr/bin && export TERM=xterm-256color && /data/NXMC/start_nxmc.sh'; fi" >> ~/.bashrc
