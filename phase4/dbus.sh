# D-Bus Phase 4
./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --runstatedir=/run                   \
            --enable-user-session                \
            --disable-static                     \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --docdir=/usr/share/doc/dbus-1.14.10 \
            --with-system-socket=/run/dbus/system_bus_socket

make

if $RUN_TESTS
then
    set +e
    make check
    set -e
fi

make install

ln -sfv /etc/machine-id /var/lib/dbus
