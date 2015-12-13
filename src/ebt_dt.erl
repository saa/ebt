-module(ebt_dt).

-export([timestamp/0]).
-export([datetime_to_timestamp/1]).

%%====================================================================
%% API
%%====================================================================

-spec timestamp() -> non_neg_integer().
timestamp() ->
    {Mega, Secs, _} = now(),
    Mega * 1000000 + Secs.

-spec datetime_to_timestamp(calendar:datetime()) -> non_neg_integer().
datetime_to_timestamp({Date, {H, M, S}}) ->
    EpochGreSeconds = calendar:datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}}),
    CurGregSeconds = calendar:datetime_to_gregorian_seconds({Date, {H, M, round(S)}}),
    CurGregSeconds - EpochGreSeconds.
