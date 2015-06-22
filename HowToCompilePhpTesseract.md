# How to compile python-tesseract (for Ubuntu Precise) #
```
sudo apt-get install libtesseract-dev libleptonica-dev php5-dev swig libcv-dev
svn checkout http://php-tesseract.googlecode.com/svn/trunk/ php-tesseract
cd php-tesseract
make clean
make
sudo make install
make test

```

p.s.
_make sure the function dl is enabled_
```
cat /etc/php5/cli/php.ini |grep -i enable_dl
enable_dl = On
```