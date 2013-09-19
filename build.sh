#!/bin/bash
device=(jfltexx endeavoru m7ul i9300 i9305 t0lte mako toro grouper jflteatt jfltecan jfltecri jfltespr jfltetmo jflteusc jfltevzw)

for i in "${device[@]}"
do
  rm -rf out/target/product/$i/*.zip*
  sh build-probam.sh $i
  if [ -f out/target/product/$i/probam_*.zip ]
	then
		version=(basename out/target/product/$i/probam_*.zip | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
		scp out/target/product/$i/*.zip probam@upload.goo.im:/home/probam/public_html/$i/
		scp out/target/product/$i/*.zip root@31.220.42.102:/var/www/
		scp out/target/product/$i/*.zip jumoogpro@frs.sourceforge.net:/home/frs/project/probam/
		perl ttytter.pl -status="ProBam ${version} for ${i} is done"
		rm -rf out/target/product/$i/*.zip*
  fi
done