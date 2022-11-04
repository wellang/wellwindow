CC= gcc
CFLAGS= '-lglfw -lGLESv2 -g'

WESM= wesm
WFILE= main.well
OUT= window
WFLAGS= -i -a -o $(OUT) -cc $(CFLAGS)

all: base

base:
	$(WESM) $(WFILE) $(WFLAGS)

clean:
	rm -f $(OUT) a.asm
