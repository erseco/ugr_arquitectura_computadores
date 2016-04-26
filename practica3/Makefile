###############################################################################
#
# AC - Arquitectura de Computadores
# Grado en Ingeniería Informática
#
# 2016 - Ernesto Serrano <erseco@correo.ugr.es>
# ---------------------------------------------
#
# Fichero Makefile para generacion de ejecutables, paquetes y documentacion
#
###############################################################################

# VARIABLES
BIN 	= bin
SRC 	= src

# Definición de compiladores
CC = gcc -O2 -fopenmp

# banderas para el enlazador
# Se indica directorios donde encontrar las funciontecas con -L. Usando -l seguido del
# nombre se indica la funcionteca que se desea enlazar.
OS := $(shell uname)
ifeq ($(OS),Darwin) #flags para MAC OS X
CC = gcc-4.9 -O2 -fopenmp
endif

# Colección de objetos a compilar
OBJECTS = if-clause if-clauseModificado scheduled-clause scheduled-clauseModificado scheduled-clause scheduled-clauseModificado4 scheduled-clauseModificado4 pmtv-secuencial pmtv-OpenMP pmm-secuencial pmm-OpenMP

# TODO (sin empaquetado)
all: clean $(OBJECTS)


# COMPILACION (asi de chulo)
$(OBJECTS):
	$(CC) -o $(BIN)/$@ $(SRC)/$@.c

# sumavectores:
# 	gcc -O2 $(SRC)/SumaVectores.c -o $(BIN)/SumaVectores -lrt

# sumavectores_asm:
# 	gcc -O2 $(SRC)/SumaVectores.c -S -o $(SRC)/SumaVectores.s -lrt


# EMPAQUETADO
# Genera el archivo .tgz de la práctica mediante la linea de comandos
# Omite los archivos propios de MacOSX y coge el nombre del directorio como nombre
.PHONY: package
package: clean
	@echo "Empaquetando..."
	tar --exclude "*.tgz" --exclude "*.DS_Store" --exclude "*.pdf" --exclude "__MACOSX" --exclude datos -czvf ../$(shell basename "$(CURDIR)").tgz .

# LIMPEZA
# Limpia los archivos compilados, así como los archivos objeto y los paquetes zip
.PHONY: clean
clean:
	@echo "Limpiando..."
	@rm -f $(BIN)/*