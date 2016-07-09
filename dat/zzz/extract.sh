#!/bin/bash
mkdir tp
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
  echo $f > $var'/nome'
  unzip $f -d $var'/'
  mv $f $var'/'
  ((var++))
done


