# Texinfo Phase 4
./configure --prefix=/usr

make

if $RUN_TESTS
then
    set +e
    make check
    set -e
fi

make install

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd
