LIB_DIR = ./libc
BIN = programa

# Objetivos PHONY
.PHONY: all build run

# Objetivo por defecto: compilar y ejecutar
all: build run

# Compilar el programa
build:
	gcc main.c -o $(BIN) -I$(LIB_DIR) -L$(LIB_DIR) -lecho -Wl,-rpath=$(LIB_DIR)

# Ejecutar el programa
run:
	./$(BIN)