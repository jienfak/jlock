<mkconfig

VERSION = 1.4
CPPFLAGS = $ADDCPPFLAGS \
	-DVERSION=\"$VERSION\" -D_DEFAULT_SOURCE
CFLAGS = $ADDCFLAGS \
	-I. -I$USRINC -I$X11INC -I/usr/include/freetype2
LDFLAGS = -s -L$USRLIB -lc -lcrypt -L$X11LIB -lX11 -lfontconfig -lXft -lXrandr -lXext

SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = xlck

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	sudo cp -f $TGT $BIN/
	sudo chmod 0755 $BIN/$TGT
	sudo chmod u+s $BIN/$TGT
uninstall: 
	rm -f $ROOT/share/man/man1/$TGT.1 $ROOT/bin/$TGT
clean :
	rm -rf $TGT *.o 
