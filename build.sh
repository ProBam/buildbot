#!/bin/bash
device=(jfltexx endeavoru m7ul n7100 i9300 i9305 t0lte t0lteatt mako toro toroplus grouper jflteatt jfltecan jfltecri jfltespr jfltetmo jflteusc jfltevzw)

for i in "${device[@]}"
do
  rm -rf out/target/product/$i/*.zip*
  sh build-probam.sh -g $i
  if [ -f out/target/product/$i/probam_*_$i.zip ]
	then
		version=$(basename out/target/product/$i/probam_*_$i.zip | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
		scp out/target/product/$i/probam_*_$i.zip probam@upload.goo.im:/home/probam/public_html/$i/
		scp out/target/product/$i/probam_*_$i.zip root@31.220.42.102:/var/www/
		scp out/target/product/$i/probam_*_$i-gapps.zip jumoogpro@frs.sourceforge.net:/home/frs/project/probam/
		perl ttytter.pl -status="ProBam ${version} for ${i} is done"
		rm -rf out/target/product/$i/*.zip*
  fi
done
