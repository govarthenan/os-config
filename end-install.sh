# ASAP
sudo pacman -Syy
sudo pacman -S archlinux-keyring endeavouros-keyring && sudo pacman -Syy  # if above update command give errors only
sudo pacman -S nethogs

# rate mirrors for fast installation
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp
cp /etc/pacman.d/endeavouros-mirrorlist /etc/pacman.d/endeavouros-mirrorlist.bkp
rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist
rate-mirrors endeavouros | sudo tee /etc/pacman.d/endeavouros-mirrorlist
sudo chattr +i /etc/pacman.d/mirrorlist
sudo chattr +i /etc/pacman.d/endeavouros-mirrorlist
sudo pacman -Syy

# Post install
sudo pacman -Syyu

# ASUS & NVIDIA stuff
# follow arch-wiki
# install nvidia-dkms
# go through the guide and set up repos, asusctl, supergfxctl etc.  --not really needed

# Install packages
sudo pacman -S yay obs-studio calibre vlc htop gedit qbittorrent libreoffice-still baobab flatpak lollypop python-black jupyter-nbformat
yay -S google-chrome stacer visual-studio-code-bin

# Install jetbrains toolbox
curl -L -O "https://download.jetbrains.com/toolbox/jetbrains-toolbox-{latest_ver}.tar.gz"
sudo tar -xzf jetbrains-toolbox-{latest_ver}.tar.gz -C /opt

# Setup flatpak and...
flatpak install zoom flatseal jdownloader foliate warehouse resources

# Setup mamba
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
mamba config --set auto_activate_base false

# Make VSCode detect mamba envs
mamba activate base
mamba install nb_conda  # This might fail due to a deprecation in setuptools, and return 127
mamba install nb_conda_kernels  # This package can be used to replace the above command

# numlock on boot
yay -S mkinitcpio-numlock
# go to /etc/mkinitpcio.conf
# add the word `numlock` to HOOKS options. make sure it's after `keymap`
HOOKS=(base udev autodetect modconf kms keyboard keymap numlock consolefont block filesystems fsck)

# To Do
# configure audio
# install and configure bluetooth
# configure zoom
# configure keyboard backlight
# configure vs code
# install zsh
# checkout termux

# configure zsh
sudo pacman -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-history-substring-search
# run `zsh` to verify
# don't do anything in the zsh-newuser-install, just exit without doing anything

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# nothing to configure

# install powerlevel10k theme, follow README
https://github.com/romkatv/powerlevel10k
# fonts need to be installed, and set in terminal application
