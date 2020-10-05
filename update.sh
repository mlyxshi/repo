rm Packages*  
dpkg-scanpackages -m ./debs > Packages 
bzip2 Packages
git add .
git commit -m "update"
git push