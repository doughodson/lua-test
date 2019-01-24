#
# remove any generated build files
#
rm -rf ../gmake
#
# remove any compiled libraries
#
rm -rf ../../lib/*.lib
#
# create new build files files
#
./premake5-alpha13 --os=linux --file=premake5.lua gmake

