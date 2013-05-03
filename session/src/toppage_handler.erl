-module(toppage_handler).

-export([before_/2]).
-export([index_/4]).

before_(_X, Req) ->
    case giallo_session:exists(Req) of
        true  -> {ok, []};
        false ->
            Req1 = giallo_session:new(Req),
            giallo_session:set(<<"X">>, <<"Nothing">>, Req1),
            {ok, [], Req1}
    end.

index_(<<"GET">>, [], _Extra, Req) ->
    case giallo:query_param(<<"X">>, Req) of
        undefined -> ok;
        Val       -> giallo_session:set(<<"X">>, Val, Req)
    end,
    {ok, [{<<"session_param">>, giallo_session:get(<<"X">>, Req)}, Req]}.
