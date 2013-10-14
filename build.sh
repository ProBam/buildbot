#!/bin/bash
device=(jfltexx endeavoru m7ul mb886 n7100 p880 i9300 i9305 t0lte t0lteatt mako toro toroplus grouper jflteatt jfltecan jfltecri jfltespr jfltetmo jflteusc jfltevzw)

for i in "${device[@]}"
do
  rm -rf out/target/product/$i/*.zip*
  sh build-probam.sh $i
  if [ -f out/target/product/$i/probam_*_$i.zip ]
	then
		version=$(basename out/target/product/$i/probam_*_$i.zip | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
		scp out/target/product/$i/probam_*_$i.zip root@37.139.24.177:/home/rsync/
		rm -rf out/target/product/$i/*.zip*
  fi
done
