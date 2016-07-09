#!/bin/bash
rm -rf tp
mkdir -p tp
unzip -x *.zip -d tp/
cd tp

ls | while read -r FILE
do
    mv -v "$FILE" `echo $FILE | tr ' ' '_' | tr -d '[{}(),\!]' | tr -d "\'" | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g'`
done


var=0
for f in *
do
  mkdir $var
  mv $f $var'/'
  cd $var

  echo $f > nome

  unzip $f 
  unrar x $f 
  tar zxvf $f 

  cd ..

  ((var++))
done

find ./ -name "*__M*" -type d -print0 | while read -d $'\0'f; do rm -rf $f; done
