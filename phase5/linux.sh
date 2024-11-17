# LINUX Phase 5

CONFIGFILE=config-$KERNELVERS

make mrproper

if [ -f $PWD/.config ];then
	make olddefconfig
elif [ -f /boot/$CONFIGFILE ];then
    cp /boot/$CONFIGFILE ./.config
    make olddefconfig
else
    make defconfig
fi

make

make modules_install

cp ./.config /boot/$CONFIGFILE

cp arch/x86_64/boot/bzImage /boot/vmlinuz-$KERNELVERS-lfs-$LFS_VERSION-systemd

cp System.map /boot/System.map-$KERNELVERS

install -d /usr/share/doc/linux-$KERNELVERS
cp -r Documentation -T /usr/share/doc/linux-$KERNELVERS

