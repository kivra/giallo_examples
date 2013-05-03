#!/bin/sh
erl -pa ebin deps/*/ebin -s basic \
	-eval "io:format(\"Point your browser to http://localhost:8080/~n\")."
