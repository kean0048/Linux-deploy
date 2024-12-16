# Python Phase 4
./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --enable-optimizations

echo $(MAKEFLAGS)
make -j8
make install

cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

install -v -dm755 /usr/share/doc/python-3.13.0/html

tar --no-same-owner \
    -xvf ../python-3.13.0-docs-html.tar.bz2
cp -R --no-preserve=mode python-3.13.0-docs-html/* \
    /usr/share/doc/python-3.13.0/html

