# How to install php-tesseract #
sudo apt-get install python-distutils-extra tesseract-ocr tesseract-ocr-eng libtesseract-dev libleptonica-dev php5-dev swig libcv-dev build-essential subversion

## For Precise or Quantal ##
1.
```
svn checkout http://php-tesseract.googlecode.com/svn/trunk/ php-tesseract
cd php-tesseract
./configure --prefix=/usr
make
sudo make install
make test
```
2. copy tesseract.php into your program directory

&lt;BR&gt;


```
wget http://php-tesseract.googlecode.com/files/tesseract.php
wget http://php-tesseract.googlecode.com/files/eurotext.jpg
wget http://php-tesseract.googlecode.com/files/test.php
php test.php
```

p.s.
_make sure the function dl is enabled_
```
cat /etc/php5/cli/php.ini |grep -i enable_dl
enable_dl = On
```