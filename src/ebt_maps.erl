-module(ebt_maps).

-export([to_lists/2]).
-export([to_lists/1]).
-export([from_lists/1]).
-export([from_lists/2]).


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


from_lists(List) ->
    maps:from_list(from_lists(List, [])).

from_lists([], Acc) ->
    Acc;
from_lists([{Key, [{_,_} | _] = List} | Tail], Acc) when is_list(List) ->
    from_lists(Tail, [{ebt_convert:to_a(Key), from_lists(List)} | Acc]);
from_lists([{Key, Value} | Tail], Acc) ->
    from_lists(Tail, [{ebt_convert:to_a(Key), Value} | Acc]).
