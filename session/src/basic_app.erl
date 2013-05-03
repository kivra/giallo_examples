-module(basic_app).

-behaviour(application).

-export([start/2]).
-export([stop/1]).

%% API ------------------------------------------------------------------------

start(_Type, _Args) ->
    Dispatch = [
        {'_', [
            {"/", toppage_handler, []},
            %% Static handler
            {["/static/[...]"], cowboy_static, [
                        {directory, {priv_dir, basic, [<<"static">>]}},
                        {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
            ]}

        ]}
    ],
    giallo:start(Dispatch),
    basic_sup:start_link().

stop(_State) ->
    ok.
