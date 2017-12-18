#!/bin/sh

ldc2 \
	-d-debug -g -unittest \
	-L-lpython3.5m \
	-of tok \
	tok.d

./tok
