-module(toppage_handler).

-export([index_/4]).

index_(<<"GET">>, [], _Extra, _Req) ->
    ok.
