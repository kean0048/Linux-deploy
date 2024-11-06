# Groff Phase 4
# Groff expects the environment variable PAGE to contain the default paper size. For users in the United States, PAGE=letter is appropriate. Elsewhere, PAGE=A4 may be more suitable. While the default paper size is configured during compilation, it can be overridden later by echoing either “A4” or “letter” to the /etc/papersize file.
PAGE=letter ./configure --prefix=/usr

make -j1

make install

