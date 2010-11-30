#! /bin/bash
# supression des fichiers générés par autogen

files_to_rm=
dir_to_rm=

if [ "$1" = "-v" ]
then
	display=1
else
	display=0
	echo "autoclean.sh -v pour mode verbose"
fi

if [ -e "Makefile" ]
then
	echo "make distclean"
	make distclean
fi

if [ -e "samples/Makefile" ]
then
	(cd samples && make distclean)
fi

files_to_rm+="	aclocal.m4"
dir_to_rm+="	autom4te.cache"
files_to_rm+="	config.guess"
files_to_rm+="	config.h.in"
files_to_rm+="	config.h.in~"
files_to_rm+="	config.sub"
files_to_rm+="	configure"
files_to_rm+="	install-sh"
files_to_rm+="	ltmain.sh"
dir_to_rm+="	m4"
files_to_rm+="	missing"
files_to_rm+="	COPYING"
files_to_rm+="	INSTALL"
files_to_rm+="	Makefile"
files_to_rm+="	Makefile.in"
files_to_rm+="	config.h"
files_to_rm+="	config.log"
files_to_rm+="	config.status"
files_to_rm+="	libtool"
files_to_rm+="	stamp-h1"
files_to_rm+="	depcomp"

#src
files_to_rm+="		src/GefConsole/Makefile"
files_to_rm+="		src/GefConsole/Makefile.in"
files_to_rm+="		src/GefConsole/*.o"

#samples
files_to_rm+="	samples/Makefile.in"
files_to_rm+="	samples/Makefile"

#samples/OpenGL
files_to_rm+="	samples/OpenGL/OpenGL"
files_to_rm+="	samples/OpenGL/OpenGL"
dir_to_rm+="	samples/OpenGL/.deps"
files_to_rm+="	samples/OpenGL/Makefile"
files_to_rm+="	samples/OpenGL/Makefile.in"
files_to_rm+="	samples/OpenGL/*.o"

echo "AUTOCLEAN :"

for f in $files_to_rm
do
	if [ "$display" = 1 ]
	then
		echo "rm -f $f"
	fi
	rm -f "$f"
done

for d in $dir_to_rm
do
	if [ "$display" = 1 ]
	then
		echo "rm $d -dir -f"
	fi
	rm "$d" -dir -f
done

echo "AUTOCLEAN - COMPLETED"

