# Makefile for cheat-golibc

#tested in ubuntu
buildlinux:
	gcc -shared -fPIC -o libmymath.so mymath.c


buildContainer:
	gcc -shared -fPIC -o libmymath.so mymath.c


buildwindows:
	x86_64-w64-mingw32-gcc -shared -o mymath.dll mymath.c


buildmacos:
	gcc -shared -fPIC -o libmymath.dylib mymath.c