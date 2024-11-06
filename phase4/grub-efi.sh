# section 4 for grub
mkdir -pv /usr/share/fonts/unifont &&
gunzip -c ../unifont-15.1.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf

echo depends bli part_gpt > grub-core/extra_deps.lst

unset {C,CPP,CXX,LD}FLAGS

case $(uname -m) in i?86 )
    tar xf ../gcc-14.2.0.tar.xz
    mkdir gcc-14.2.0/build
    pushd gcc-14.2.0/build
        ../configure --prefix=$PWD/../../x86_64-gcc \
                     --target=x86_64-linux-gnu      \
                     --with-system-zlib             \
                     --enable-languages=c,c++       \
                     --with-ld=/usr/bin/ld
        make all-gcc
        make install-gcc
    popd
    export TARGET_CC=$PWD/x86_64-gcc/bin/x86_64-linux-gnu-gcc
esac

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --disable-efiemu     \
            --enable-grub-mkfont \
            --with-platform=efi  \
            --target=x86_64      \
            --disable-werror     &&
unset TARGET_CC &&
make

make install &&
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
