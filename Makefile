BIN = cal cat false head pwd true wc yes
OBJ = $(BIN:=.o)
SRC = $(BIN:=.zig)
HDR = $(BIN:=.h)

IGN = $(OBJ) $(BIN) $(HDR)

all: $(BIN)

clean:
	$(RM) $(BIN) $(OBJ) $(HDR)

.PHONY: all clean

%: %.o
	zig build-exe --name $@ --object $<

%.o: %.zig
	zig build-obj $<

.gitignore: Makefile
	> $@
	for file in $(IGN) ; do echo "$$file" >> $@ ; done
