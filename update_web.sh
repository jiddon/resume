#!/bin/bash
echo '```' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '---' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'author_profile: true' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'permalink: /cv/cv_txt/' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo 'layout: archive' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '---' | cat - jpi_cv.txt > temp && mv temp jpi_cv.txt
echo '```' >> jpi_cv.txt

cp jpi_cv.pdf ../jiddon.github.io/files/jpi_cv.pdf
cp jpi_cv.txt ../jiddon.github.io/_pages/cv_txt.md

cd ../jiddon.github.io/

if [[ $# == 1 && $1 == "push" ]]; then
  git add files/jpi_cv.pdf 
  git commit -m "Update cv"
  git push
else
  echo "Specify push to push to github pages."
fi

cd - > /dev/null
