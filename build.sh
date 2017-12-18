#!/bin/sh

ldc2 \
	-d-version=Python_2_4_Or_Later -d-version=Python_2_5_Or_Later -d-version=Python_2_6_Or_Later -d-version=Python_2_7_Or_Later \
	-d-version=Python_3_0_Or_Later -d-version=Python_3_1_Or_Later -d-version=Python_3_2_Or_Later -d-version=Python_3_3_Or_Later \
	-d-version=Python_3_4_Or_Later -d-version=Python_3_5_Or_Later -d-version=Python_Unicode_UCS4 \
	-d-debug -g -unittest \
	-L-lpython3.5m \
	-of tok \
	tok.d snobject.d pyport.d

./tok
