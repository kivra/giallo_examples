-module(echo_handler).

-export([index_/4]).
-export([queryparam/4]).
-export([postparam/4]).

index_(<<"GET">>, [], _Extra, _Req) ->
    ok.

queryparam(<<"GET">>, [], _Extra, Req) ->
    {ok, [{param, giallo:query_param(<<"param">>, Req)}]}.

postparam(<<"POST">>, [], _Extra, Req) ->
    {ok, [{param, giallo:post_param(<<"param">>, Req)}]}.
