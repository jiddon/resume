#!/bin/bash
echo "cp jpi_cv.html style.css ../jiddon.github.io/"
cp jpi_cv.html style.css ../jiddon.github.io/
echo "cd ../jiddon.github.io/"
cd ../jiddon.github.io/
echo "git add jpi_cv.html style.css"
git add jpi_cv.html style.css
echo "git commit -m "Update""
git commit -m "Update"
echo "git push origin main"
git push origin main
echo "cd -"
cd -
