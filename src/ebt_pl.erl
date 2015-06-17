-module(ebt_pl).

-export([get/2]).
-export([get/3]).
-export([get_conv/3]).

-spec get(any(), [{any(), any()}]) -> any().
get(Key, PL) ->
    ebt_pl:get(Key, PL, undefined).

-spec get(any(), [{any(), any()}], any()) -> any().
get(Key, PL, Default) ->
    case lists:keyfind(Key, 1, PL) of
        {Key, Value} -> Value;
        false -> Default
    end.

get_conv(Key, PL, ToType) ->
    case ebt_pl:get(Key, PL) of
        undefined ->
            undefined;
        Value ->
            ebt_convert:convert(Value, ToType)
    end.










