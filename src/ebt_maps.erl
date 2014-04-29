-module(ebt_maps).

-export([to_lists/1]).
-export([from_lists/1]).


to_lists(Map) when is_map(Map) ->
    to_lists(maps:to_list(Map));
to_lists(List) when is_list(List) ->
    to_lists(List, []);
to_lists({Key, Value}) ->
    {Key, to_lists(Value)};
to_lists(Untouched) ->
    Untouched.
to_lists([], Ready) ->
    lists:reverse(Ready);
to_lists([Head|Rest], Ready) ->
    to_lists(Rest, [to_lists(Head)|Ready]).


from_lists(List) when is_list(List) ->
    case ebt_lists:is_proplist(List) of
        true ->
            maps:from_list(lists:map(fun prepare_proplist/1, List));
        false ->
            from_lists(List, [])
    end;
from_lists(Map) when is_map(Map) ->
    maps:map(fun (_Key, Value) -> from_lists(Value) end, Map);
from_lists(Untouched) ->
    Untouched.

from_lists([], Acc) ->
    Acc;
from_lists([Term| Rest], Acc) ->
    from_lists(Rest, [from_lists(Term)| Acc]).

prepare_proplist({Key, Value}) ->
    {ebt_convert:to_a(Key), from_lists(Value)}.
