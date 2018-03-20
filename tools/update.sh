#!/bin/sh
find . -name "*.h" -o -name "*.cpp" -o -name "*.c" > cscope.files
cscope -Rbkq -i cscope.files
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q
