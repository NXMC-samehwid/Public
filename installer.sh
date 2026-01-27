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
mkdir -p ~/.termux/boot

cat <<'EOF' > ~/.termux/boot/start_nxmc.sh
#!/data/data/com.termux/files/usr/bin/bash
export PATH=$PATH:/data/data/com.termux/files/usr/bin
export TERM=xterm-256color

su -c 'nohup /data/NXMC/start_nxmc.sh >/dev/null 2>&1 &'
EOF

chmod +x ~/.termux/boot/start_nxmc.sh

grep -q start_nxmc.sh ~/.bashrc || cat <<'EOF' >> ~/.bashrc
su -c 'nohup /data/NXMC/start_nxmc.sh >/dev/null 2>&1 &'
EOF