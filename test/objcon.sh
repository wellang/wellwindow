# gcc -fno-asynchronous-unwind-tables -lbgfx -s -c -o test.o test.c
# ~/objconv/objconv -fnasm test.o
#

#!/bin/sh
set -e
help(){
  echo "$1: Uses gcc and objconv to convert a C program to nasm"
  echo "usage: $1 <sourcefile.c>"
  exit 0
}
[ -z "$1" ] || [ "$1" == "-h" ] && help "$(dirname "$0")"

C_FILE="$1"
O_FILE="$C_FILE.o"
NASM_FILE="$C_FILE.asm"
NASM_O_FILE="$NASM_FILE.o"
EXEC_FILE="$C_FILE.run"
gcc -lglfw -llGLESv2 -c -o "$O_FILE" "$C_FILE"
~/objconv/objconv -fnasm "$O_FILE" "$NASM_FILE"
sed -i 's|st(0)|st0  |g' "$NASM_FILE"
sed -i 's|noexecute|         |g' "$NASM_FILE"
sed -i 's|execute|       |g' "$NASM_FILE"
sed -i 's|: function||g' "$NASM_FILE"
sed -i 's|?_|L_|g' "$NASM_FILE"
sed -i -n '/SECTION .eh_frame/q;p' "$NASM_FILE"
sed -i 's|;.*||g' "$NASM_FILE"
sed -i 's/^M//g' "$NASM_FILE"
sed -i 's|\s\+$||g' "$NASM_FILE"
sed -i 's|align=1||g' "$NASM_FILE"
