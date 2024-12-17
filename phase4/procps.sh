# Procps-ng Phase 4
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.4 \
            --disable-static                        \
            --disable-kill

#            --with-systemd

# make src_w_LDADD='$(LDADD) -lsystemd'
make 

if $RUN_TESTS
then
    set +e
    chown -R tester .
	su tester -c "PATH=$PATH make check"
    set -e
fi

make install

