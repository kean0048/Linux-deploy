#!/bin/sh

export INSTALL_MOUNT=/run/media/kean/LFSROOT

mount --bind /dev $INSTALL_MOUNT/dev
mount -vt devpts devpts -o gid=5,mode=0620 $INSTALL_MOUNT/dev/pts
mount -t sysfs sysfs $INSTALL_MOUNT/sys
mount -vt tmpfs tmpfs $INSTALL_MOUNT/run
mount -vt proc proc $INSTALL_MOUNT/proc

chroot "$LFS" /usr/bin/env \
                        HOME=$INSTALL_MOUNT/root \
                        TERM=$TERM \
                        PATH=/usr/bin:/usr/sbin
