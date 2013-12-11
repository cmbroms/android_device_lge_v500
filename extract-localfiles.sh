for i in `cat proprietary-blobs.txt`
do
`cp ../localfiles/system/$i ../../../vendor/lge/v500/proprietary/$i`
./setup-makefiles.sh
done
