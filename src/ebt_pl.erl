-module(ebt_pl).

-export([get/2]).
-export([get/3]).
-export([get_conv/3]).

%%====================================================================
%% API
%%====================================================================

-spec get(any(), [{any(), any()}]) -> any().
get(Key, PL) ->
    ebt_pl:get(Key, PL, undefined).

-spec get(any(), [{any(), any()}], any()) -> any().
get(Key, PL, Default) when is_list(PL) ->
    case lists:keyfind(Key, 1, PL) of
        {Key, Value} -> Value;
        false -> Default
    end;
get(Key, Map, Default) when is_map(Map) ->
    maps:get(Key, Map, Default).

-spec get_conv(term(), term(), term()) -> term().
get_conv(Key, PL, ToType) ->
    case ebt_pl:get(Key, PL) of
        undefined ->
            undefined;
        Value ->
            ebt_convert:convert(Value, ToType)
    end.
