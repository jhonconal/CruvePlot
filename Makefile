#############################################################################
# Makefile for building: CruvePlot
# Generated by qmake (2.01a) (Qt 4.8.5) on: ?? 7? 29 17:15:24 2015
# Project:  CruvePlot.pro
# Template: app
# Command: /usr/local/Trolltech/Qt-4.8.5/bin/qmake -spec /usr/local/Trolltech/Qt-4.8.5/mkspecs/linux-g++ -o Makefile CruvePlot.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/usr/local/Trolltech/Qt-4.8.5/mkspecs/linux-g++ -I. -I/usr/local/Trolltech/Qt-4.8.5/include/QtCore -I/usr/local/Trolltech/Qt-4.8.5/include/QtGui -I/usr/local/Trolltech/Qt-4.8.5/include -I. -I. -I.
LINK          = g++
LFLAGS        = -Wl,-O1 -Wl,-rpath,/usr/local/Trolltech/Qt-4.8.5/lib
LIBS          = $(SUBLIBS)  -L/usr/local/Trolltech/Qt-4.8.5/lib -lQtGui -L/usr/local/Trolltech/Qt-4.8.5/lib -L/usr/X11R6/lib -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/local/Trolltech/Qt-4.8.5/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = cruveplotwidget.cpp \
		main.cpp \
		posix_qextserialport.cpp \
		qcustomplot.cpp \
		qextserialbase.cpp \
		serialassiant.cpp moc_cruveplotwidget.cpp \
		moc_qcustomplot.cpp \
		moc_qextserialbase.cpp \
		moc_serialassiant.cpp \
		qrc_cruve.cpp
OBJECTS       = cruveplotwidget.o \
		main.o \
		posix_qextserialport.o \
		qcustomplot.o \
		qextserialbase.o \
		serialassiant.o \
		moc_cruveplotwidget.o \
		moc_qcustomplot.o \
		moc_qextserialbase.o \
		moc_serialassiant.o \
		qrc_cruve.o
DIST          = /usr/local/Trolltech/Qt-4.8.5/mkspecs/common/unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/linux.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base-unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-base.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/qconfig.pri \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_functions.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_config.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/exclusive_builds.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_pre.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/release.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_post.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/shared.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/warn_on.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/thread.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/moc.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/resources.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/uic.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/yacc.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/lex.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/include_source_dir.prf \
		CruvePlot.pro
QMAKE_TARGET  = CruvePlot
DESTDIR       = 
TARGET        = CruvePlot

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): ui_cruveplotwidget.h ui_serialassiant.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: CruvePlot.pro  /usr/local/Trolltech/Qt-4.8.5/mkspecs/linux-g++/qmake.conf /usr/local/Trolltech/Qt-4.8.5/mkspecs/common/unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/linux.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base-unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-base.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-unix.conf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/qconfig.pri \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_functions.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_config.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/exclusive_builds.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_pre.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/release.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_post.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/shared.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/warn_on.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/thread.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/moc.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/resources.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/uic.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/yacc.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/lex.prf \
		/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/include_source_dir.prf \
		/usr/local/Trolltech/Qt-4.8.5/lib/libQtGui.prl \
		/usr/local/Trolltech/Qt-4.8.5/lib/libQtCore.prl
	$(QMAKE) -spec /usr/local/Trolltech/Qt-4.8.5/mkspecs/linux-g++ -o Makefile CruvePlot.pro
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/unix.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/linux.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/gcc-base-unix.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-base.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/common/g++-unix.conf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/qconfig.pri:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_functions.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt_config.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/exclusive_builds.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_pre.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/release.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/default_post.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/shared.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/warn_on.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/qt.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/unix/thread.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/moc.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/resources.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/uic.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/yacc.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/lex.prf:
/usr/local/Trolltech/Qt-4.8.5/mkspecs/features/include_source_dir.prf:
/usr/local/Trolltech/Qt-4.8.5/lib/libQtGui.prl:
/usr/local/Trolltech/Qt-4.8.5/lib/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -spec /usr/local/Trolltech/Qt-4.8.5/mkspecs/linux-g++ -o Makefile CruvePlot.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/CruvePlot1.0.0 || $(MKDIR) .tmp/CruvePlot1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/CruvePlot1.0.0/ && $(COPY_FILE) --parents cruveplotwidget.h posix_qextserialport.h qcustomplot.h qextserialbase.h serialassiant.h .tmp/CruvePlot1.0.0/ && $(COPY_FILE) --parents cruve.qrc .tmp/CruvePlot1.0.0/ && $(COPY_FILE) --parents cruveplotwidget.cpp main.cpp posix_qextserialport.cpp qcustomplot.cpp qextserialbase.cpp serialassiant.cpp .tmp/CruvePlot1.0.0/ && $(COPY_FILE) --parents cruveplotwidget.ui serialassiant.ui .tmp/CruvePlot1.0.0/ && (cd `dirname .tmp/CruvePlot1.0.0` && $(TAR) CruvePlot1.0.0.tar CruvePlot1.0.0 && $(COMPRESS) CruvePlot1.0.0.tar) && $(MOVE) `dirname .tmp/CruvePlot1.0.0`/CruvePlot1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/CruvePlot1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc_cruveplotwidget.cpp moc_qcustomplot.cpp moc_qextserialbase.cpp moc_serialassiant.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_cruveplotwidget.cpp moc_qcustomplot.cpp moc_qextserialbase.cpp moc_serialassiant.cpp
moc_cruveplotwidget.cpp: qcustomplot.h \
		cruveplotwidget.h
	/usr/local/Trolltech/Qt-4.8.5/bin/moc $(DEFINES) $(INCPATH) cruveplotwidget.h -o moc_cruveplotwidget.cpp

moc_qcustomplot.cpp: qcustomplot.h
	/usr/local/Trolltech/Qt-4.8.5/bin/moc $(DEFINES) $(INCPATH) qcustomplot.h -o moc_qcustomplot.cpp

moc_qextserialbase.cpp: qextserialbase.h
	/usr/local/Trolltech/Qt-4.8.5/bin/moc $(DEFINES) $(INCPATH) qextserialbase.h -o moc_qextserialbase.cpp

moc_serialassiant.cpp: qextserialbase.h \
		posix_qextserialport.h \
		serialassiant.h
	/usr/local/Trolltech/Qt-4.8.5/bin/moc $(DEFINES) $(INCPATH) serialassiant.h -o moc_serialassiant.cpp

compiler_rcc_make_all: qrc_cruve.cpp
compiler_rcc_clean:
	-$(DEL_FILE) qrc_cruve.cpp
qrc_cruve.cpp: cruve.qrc \
		kaiti.TTF
	/usr/local/Trolltech/Qt-4.8.5/bin/rcc -name cruve cruve.qrc -o qrc_cruve.cpp

compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_cruveplotwidget.h ui_serialassiant.h
compiler_uic_clean:
	-$(DEL_FILE) ui_cruveplotwidget.h ui_serialassiant.h
ui_cruveplotwidget.h: cruveplotwidget.ui \
		qcustomplot.h
	/usr/local/Trolltech/Qt-4.8.5/bin/uic cruveplotwidget.ui -o ui_cruveplotwidget.h

ui_serialassiant.h: serialassiant.ui
	/usr/local/Trolltech/Qt-4.8.5/bin/uic serialassiant.ui -o ui_serialassiant.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_rcc_clean compiler_uic_clean 

####### Compile

cruveplotwidget.o: cruveplotwidget.cpp cruveplotwidget.h \
		qcustomplot.h \
		ui_cruveplotwidget.h \
		serialassiant.h \
		qextserialbase.h \
		posix_qextserialport.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o cruveplotwidget.o cruveplotwidget.cpp

main.o: main.cpp cruveplotwidget.h \
		qcustomplot.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

posix_qextserialport.o: posix_qextserialport.cpp posix_qextserialport.h \
		qextserialbase.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o posix_qextserialport.o posix_qextserialport.cpp

qcustomplot.o: qcustomplot.cpp qcustomplot.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qcustomplot.o qcustomplot.cpp

qextserialbase.o: qextserialbase.cpp qextserialbase.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qextserialbase.o qextserialbase.cpp

serialassiant.o: serialassiant.cpp serialassiant.h \
		qextserialbase.h \
		posix_qextserialport.h \
		ui_serialassiant.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o serialassiant.o serialassiant.cpp

moc_cruveplotwidget.o: moc_cruveplotwidget.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_cruveplotwidget.o moc_cruveplotwidget.cpp

moc_qcustomplot.o: moc_qcustomplot.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_qcustomplot.o moc_qcustomplot.cpp

moc_qextserialbase.o: moc_qextserialbase.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_qextserialbase.o moc_qextserialbase.cpp

moc_serialassiant.o: moc_serialassiant.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_serialassiant.o moc_serialassiant.cpp

qrc_cruve.o: qrc_cruve.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o qrc_cruve.o qrc_cruve.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:
