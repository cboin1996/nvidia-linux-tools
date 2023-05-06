# File inspired from : https://forums.developer.nvidia.com/t/nvidia-driver-does-not-load-on-ubuntu-21-04-with-geforce-rtx-3060/187554/4

all: clean prepare headers

clean:
	sudo apt remove --purge '^nvidia-.*'
	sudo apt remove --purge '^libnvidia-.*'
	sudo rm /etc/X11/xorg.conf | true
	sudo rm /etc/X11/xorg.conf.d/90-nvidia-primary.conf | true
	sudo rm /usr/share/X11/xorg.conf.d/10-nvidia.conf | true
	sudo rm /usr/share/X11/xorg.conf.d/11-nvidia-prime.conf | true
	sudo rm /etc/modprobe.d/nvidia-kms.conf | true
	sudo rm /lib/modprobe.d/nvidia-kms.conf | true
	echo "run 'grep blacklist /etc/modprobe.d/* /lib/modprobe.d/* | grep nvidia' and delete any files"

prepare:
	sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
	echo "install the recommended driver through the additional drivers ubuntu app"

headers:
	sudo apt remove --purge linux-headers-$(uname -r)
	sudo apt install linux-headers-$(uname -r)
	sudo apt install linux-image-generic
	sudo apt install linux-headers-generic

# finalize is not used anymore, more of a 20.04 thing.
finalize:
	sudo bash -c "echo options nvidia_drm modeset=1 > /etc/modprobe.d/nvidia-kms.conf"
	sudo bash -c "echo options nvidia-drm modeset=0 > /lib/modprobe.d/nvidia-kms.conf"
	sudo update-initramfs -u

# used to have to run configure post finalize, but that doesnt seem to be the case anymore.
# configure:
# 	sudo nvidia-xconfig
# 	sudo prime-select nvidia
