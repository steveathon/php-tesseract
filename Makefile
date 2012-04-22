PREFIX=$(shell php-config --prefix)

	 
all: tesseract.so

tesseract.so : main_dummy.o tesseract_wrap.o
	gcc -shared main_dummy.o tesseract_wrap.o -o tesseract.so -lstdc++ -ltesseract -llept -lopencv_core

tesseract_wrap.cpp : tesseract.i
	swig -c++ -php -I. -I/usr/include/tesseract/ -I/usr/include -I/usr/include/leptonica tesseract.i

tesseract_wrap.o : tesseract_wrap.cpp
	gcc -c -fpic tesseract_wrap.cpp -o tesseract_wrap.o -I /usr/include -I /usr/include/leptonica -I /usr/include/tesseract/ `php-config --includes`

main_dummy.o : main_dummy.cpp 
	gcc -c -fpic main_dummy.cpp -o main_dummy.o  -I. -I /usr/include/tesseract/ -I /usr/include/leptonica

test:
	echo "testing 1"
	php tesseract.php
	echo "testing 2"
	#cp tesseract.php test 
	#cd test
	php test/test.php
clean:
	rm -f *.o
	rm build -Rf
	rm -f *.cxx
	rm -f tesseract*.py*
	rm -f *wrap*
	rm -f *.so
	rm deb_dist -Rf
	rm debian/source -Rf

install:
	 install -m 0644 tesseract.so `php-config --extension-dir`
	 test -d $(PREFIX)/share/php || mkdir $(PREFIX)/share/php
	 install -m 0644 tesseract.php `php-config --prefix`/share/php/tesseract.php
	 install -m 0644 tesseract.ini /etc/php5/conf.d

uninstall:
	 rm `php-config --extension-dir`/tesseract.so
	 rm `php-config --prefix`/share/php/tesseract.php


.PHONY: install test
