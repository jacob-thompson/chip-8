ifeq (run, $(firstword $(MAKECMDGOALS)))
  # get arguments for `make run`
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

CC = gcc

CFLAGS = -I.
CFLAGS += -Wall
CFLAGS += -Wno-unused-command-line-argument

SDLFLAGS = `sdl2-config --libs --cflags`
SDLFLAGS += -I/opt/homebrew/Cellar/sdl2/*/include

IDIR = include
_DEPS = emulator.h display.h stack.h timers.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

BDIR = build
_OBJ = emulator.o display.o stack.o chip8.o
OBJ = $(patsubst %, $(BDIR)/%, $(_OBJ))

OUT = chip8

.PHONY: clean

$(BDIR)/%.o: src/%.c $(DEPS) clean
	$(CC) -c -o $@ $< $(CFLAGS) $(SDLFLAGS)

$(OUT): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(SDLFLAGS)

run:
	./$(OUT) $(RUN_ARGS)

test:
	./$(OUT) roms/corax+.ch8

clean:
	rm -f $(OBJ) $(OUT)
