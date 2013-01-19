PREFIX=$(DESTDIR)$(shell php-config --prefix)
EXTDIR=$(DESTDIR)$(shell php-config --extension-dir)
ETCDIR=$(DESTDIR)/etc/php5/conf.d
PHPINCL=$(DESTDIR)$(shell php-config --includes)
SHAREDIR=$(PREFIX)/share/php
all: tesseract.so

tesseract.so : main_dummy.o tesseract_wrap.o
	gcc -shared main_dummy.o tesseract_wrap.o -o tesseract.so -lstdc++ -ltesseract -llept -lopencv_core 

tesseract_wrap.cpp : tesseract.i
	swig -c++ -php -I. -I/usr/include/tesseract/ -I/usr/include -I/usr/include/leptonica -I/usr/include/opencv2 tesseract.i

tesseract_wrap.o : tesseract_wrap.cpp
	gcc -c -fpic tesseract_wrap.cpp -o tesseract_wrap.o -I /usr/include -I /usr/include/leptonica -I /usr/include/tesseract/ -I /usr/include/opencv2 $(PHPINCL)

main_dummy.o : main_dummy.cpp 
	gcc -c -fpic main_dummy.cpp -o main_dummy.o  -I. -I /usr/include/tesseract/ -I /usr/include/leptonica -I /usr/include/opencv2 $(PHPINCL)

test:
	echo "testing 1"
	php tesseract.php
	echo "testing 2"
	#cp tesseract.php test 
	#cd test
	php test.php

check:
	echo "Nothing to Check"
	
distclean:
	make clean
	
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
	 test -d $(EXTDIR) || mkdir -p $(EXTDIR)
	 install -m 0644 tesseract.so $(EXTDIR)
	 test -d $(SHAREDIR) || mkdir -p $(SHAREDIR)
	 install -m 0644 tesseract.php $(SHAREDIR)
	 test -d $(ETCDIR) || mkdir -p $(ETCDIR)
	 install -m 0644 tesseract.ini $(ETCDIR)

uninstall:
	 test ! -f $(EXTDIR)/tesseract.so || rm $(EXTDIR)/tesseract.so
	 test ! -f $(SHAREDIR)/tesseract.php || rm $(SHAREDIR)/tesseract.php
	 test ! -f $(ETCDIR)/tesseract.ini  || rm $(ETCDIR)/tesseract.ini 

.PHONY: install test
