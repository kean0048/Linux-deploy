# Vim Phase 4
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make

make install
