# Installation helper for nvidia drivers

To use, run 
1. `make clean`
2. `sudo reboot now`
3. `make prepare`
4. `sudo reboot now`

# Additional Instructions for dire times
Sometimes reinstalling your image and headers can help
if your build system has become broken, and all of the
above was unsuccessful.

1. `make headers`

Furthermore, recompiling the dkms modules can be helpful:

```
sudo dkms remove --force nvidia/<insert-version-here>
sudo dkms install --force nvidia/<insert-version-here>
```
