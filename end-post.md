1. To prevent screen tearing on XFCE4, run the following command:
```
xrandr --output <display ID> --set TearFree on
```
	- To know the display ID, run `xrandr -q`, and the active displays should show up like `<screen ID> connected ...`
2. If the machine freezes at lockscreen, shutdown or reboot, check the [Ryzen CPU wiki page](https://wiki.archlinux.org/title/Ryzen) as well, in addition to NVIDIA or AMD GPU pages.
3. For Ryzen CPU undervolting: https://wiki.archlinux.org/title/Ryzen#Power_management,_undervolting_and_overclocking

# NVIDIA
0. Follow this guide: https://wiki.archlinux.org/title/NVIDIA
1. Install `nvidia-dkms` package:
```
sudo pacman -Sy dkms linux-headers nvidia-dkms
```
2. If `/etc/mkinitcpio.conf` doesn't exist, it's most likely that the distro is using dracut. If it is...
	- Make a `.conf` file in `/etc/dracut.conf.d/` with arbitrary name.
	- Write line `omit_drivers+=" nouveau "`
	- Save the file and run `sudo dracut-rebuild` or `sudo dracut --regenerate-all` or `sudo dracut --force`
## Set NVIDIA DRM
0. After trying out any of the below methods run `sudo cat /sys/module/nvidia_drm/parameters/modeset` to check if the module has loaded. `Y` if loaded `N` if not.
- Append `nvidia_drm.modeset=1` to the `GRUB_CMDLINE_LINUX_DEFAULT` line in file `/etc/default/grub` and run `sudo grub-mkconfig -o /boot/grub/grub.cfg`. Reboot.
- Create a `.conf` file in `/etc/modprobe.d/` and write `options nvidia_drm modeset=1` and reboot. 
> None of the above methods seem to work. Maybe DRM isn't needed?

# Mount disks
0. Follow this guide: https://wiki.archlinux.org/title/Fstab
1. Edit `/etc/fstab` file to mount additional partitions.
2. Ensure the UUIDs give are present in `/dev/disk/by-uuid/`

# XFCE4 configuration
1. Install `libremenu` for editing settings and creating desktop entries.
2. For the first time, when `Log Out` button is pressed, the screen might freeze and a forced reboot might be required. However, this issue disappeared after that.
3. Once Super key is set as a shortcut for one action, it can't be used in combination with other keys since Super key is a modifier key (e.g.: Alt or Ctrl). To bypass this, Super key must be substituted with another key or key combination. To do so..
	- `sudo pacman -S xcape`
	- Add `xcape -e 'Super_L=Alt_L|F1'` to *Session and Startup > Application Autostart* and enable it.

# Flatpak config
0. Visit `https://flatpak.org/setup/EndeavourOS` and follow instructions
1. If you get the following error:
```
Note that the directories 

'/var/lib/flatpak/exports/share'
'/home/gova/.local/share/flatpak/exports/share'

are not in the search path set by the XDG_DATA_DIRS environment variable, so
applications installed by Flatpak may not appear on your desktop until the
session is restarted.
```
Just logout and login.

# Dev Env Setup
1. Ruff:
```
sudo pacman -S ruff
```
2. 

# Docker config
- Install
`sudo pacman -S docker docker-compose`
- Enable docker service with socket instead of service, to start the service upon trigger
`sudo systemctl enable docker.socket`
- Add user to docker user group to enable sudoless use of docker
`sudo gpasswd -a gova docker`
- Enable native overlay diff option to make building images faster: https://wiki.archlinux.org/title/Docker#Enable_native_overlay_diff_engine
- If rancher-desktop or a similar package possibly replacing docker was installed earlier, or even docker itself, it's wise to remove `~/.docker` folder to avoid incorrect configs.
