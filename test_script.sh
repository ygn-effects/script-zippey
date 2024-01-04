#/bin/sh

python scripts/zippey/zippey.py e < test/test.FCStd > test/test.plain
python scripts/zippey/zippey.py d < test/test.plain > test/test_new.FCStd

[ -e "tmp" ] && rm -rf tmp
mkdir -p tmp/test
mkdir -p tmp/test_new

unzip -q test/test.FCStd -d tmp/test
unzip -q test/test_new.FCStd -d tmp/test_new

rm -rf test/test.plain
rm -rf test/test_new.FCStd

diff -rq tmp/test tmp/test_new
