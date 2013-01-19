DEPS_CFLAGS =-I /usr/include/leptonica -I /usr/include -I /usr/include/tesseract/ $(PHPCONFIGINCLUDES)

AM_CPPFLAGS = -shared $(DEPS_CFLAGS) $(PHPCONFIGINCLUDES)
#noinst_LTLIBRARIES	= libtesseract.la
#libtesseract_la_SOURCES	= tesseract_wrap.cpp main_dummy.cpp
#libtesseract_la_LIBADD	= -ltesseract -llept -lopencv_core
#libtesseract_la_CFLAGS	= $(DEPS_CFLAGS) $(PHPCONFIGINCLUDES)

lib_LTLIBRARIES = libtesseract.la
libtesseract_la_SOURCES	= tesseract_wrap.cpp main_dummy.cpp
libtesseract_la_LIBADD	= -ltesseract -llept -lopencv_core
libtesseract_la_CFLAGS	= $(DEPS_CFLAGS) $(PHPCONFIGINCLUDES)
