# Tcl Phase 4
#tar -xf ../$(basename $PKG_TCLDOCS) --strip-components=1
SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --disable-rpath

make

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.9|/usr/lib/tdbc1.1.9|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.9|/usr/include|"            \
    -i pkgs/tdbc1.1.9/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.3.0|/usr/lib/itcl4.3.0|" \
    -e "s|$SRCDIR/pkgs/itcl4.3.0/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.3.0|/usr/include|"            \
    -i pkgs/itcl4.3.0/itclConfig.sh

unset SRCDIR

if $RUN_TESTS
then
    set +e
    make test
    set -e
fi

make install

chmod u+w /usr/lib/libtcl8.6.so

make install-private-headers

ln -sf tclsh8.6 /usr/bin/tclsh

mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

cd ..
tar -xf ../tcl8.6.15-html.tar.gz --strip-components=1
mkdir -v -p /usr/share/doc/tcl-8.6.15
cp -v -r  ./html/* /usr/share/doc/tcl-8.6.15
