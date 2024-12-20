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

make -j`nproc`

make modules_install

cp -iv .config /boot/$CONFIGFILE -f

cp -iv arch/x86_64/boot/bzImage /boot/vmlinuz-$KERNELVERS-lfs-$LFS_VERSION -f

cp -iv System.map /boot/System.map-$KERNELVERS -f

install -d /usr/share/doc/linux-$KERNELVERS
cp -r Documentation -T /usr/share/doc/linux-$KERNELVERS

