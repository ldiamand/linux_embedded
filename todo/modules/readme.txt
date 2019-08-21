cd /lib/modules/<kernel version>
sudo find . -type f -name '*.ko' | xargs -n 1 objcopy --strip-unneeded

make INSTALL_MOD_PATH=${PROJECT_ROOT}/rootfs modules_install
