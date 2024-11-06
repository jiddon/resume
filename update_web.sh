#!/bin/bash
echo '```' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '---' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'author_profile: true' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'permalink: /cv/cv_txt/' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'layout: archive' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '---' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '```' >> jpi_cv.txt

cat jpi_cv.md | tail -n +5 > cv.md
echo '---' | cat - cv.md > temp && mv temp cv.md
echo 'author_profile: true' | cat - cv.md > temp && mv temp cv.md
echo 'permalink: /cv/' | cat - cv.md > temp && mv temp cv.md
echo 'layout: archive' | cat - cv.md > temp && mv temp cv.md
echo 'title: James Philip Iddon' | cat - cv.md > temp && mv temp cv.md
echo '---' | cat - cv.md > temp && mv temp cv.md
echo ' ' >> cv.md
echo '---' >> cv.md
echo ' ' >> cv.md
echo 'download as [pdf](../files/jpi_cv.pdf) or view in [txt](./cv_txt)' >> cv.md


cp jpi_cv.pdf ../jiddon.github.io/files/jpi_cv.pdf
cp jpi_cv.txt ../jiddon.github.io/_pages/cv_txt.md
cp cv.md ../jiddon.github.io/_pages/cv.md

cd ../jiddon.github.io/

if [[ $# == 1 && $1 == "push" ]]; then
  git add files/jpi_cv.pdf 
  git add _pages/cv_txt.md
  git add _pages/cv.md
  git commit -m "Update cv"
  git push
else
  echo "Specify push to push to github pages."
fi

cd - > /dev/null
