#!/bin/bash
cp jpi_cv.html ../jiddon.github.io/
cp style.css ../jiddon.github.io/
cp jpi_cv.pdf ../jiddon.github.io/
cp jpi_cv.txt ../jiddon.github.io/

cd ../jiddon.github.io/

head -n -2 jpi_cv.html > index.html # remove </body> and </html>
rm jpi_cv.html
echo "<hr />" >> index.html
echo "<h3 id="view-in-pdf-txt">View in <a href="./jpi_cv.pdf">pdf</a>, <a href="./jpi_cv.txt">txt</a>, <a href="https://github.com/jiddon/resume">github</a></h3> " >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html
echo "./jiddon.github.io/ updated"

if [[ $# == 1 && $1 == "push" ]]; then
  git add index.html style.css jpi_cv.pdf jpi_cv.txt
  git commit -m "Update"
  git push
else
  echo "Specify push to push to github pages."
fi

cd - > /dev/null
