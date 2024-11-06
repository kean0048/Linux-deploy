# OpenSSL Phase 4
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make

if $RUN_TESTS
then
    set +e
    make test
    set -e
fi

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.3.1

cp -vfr doc/* /usr/share/doc/openssl-3.3.1

