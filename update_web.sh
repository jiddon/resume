#!/bin/bash
cp jpi_cv.pdf ../jiddon.github.io/files/jpi_cv.pdf

cd ../jiddon.github.io/

if [[ $# == 1 && $1 == "push" ]]; then
  git add files/jpi_cv.pdf 
  git commit -m "Update cv"
  git push
else
  echo "Specify push to push to github pages."
fi

cd - > /dev/null
