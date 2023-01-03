# Procedure for install nvidia driver with `ubuntu-drivers autoinstall`

1. Locate the recommended tested driver version
2. Run `sudo apt install nvidia-dkms-version`
3. sudo dpkg --configure -a
3. Run `sudo ubuntu-drivers autoinstall`
4. Check contents for modesetting to make sure they match the following:

        - echo options nvidia_drm modeset=1 = /etc/modprobe.d/nvidia-kms.conf
        - echo options nvidia-drm modeset=0 = /lib/modprobe.d/nvidia-kms.conf
