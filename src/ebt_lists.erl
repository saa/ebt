-module(ebt_lists).

-export([ensure_list/1]).
-export([is_proplist/1]).


ensure_list(List) when is_list(List) ->
    List;
ensure_list(NotList) ->
    [NotList].


is_proplist([]) ->
    true;
is_proplist([{_, _}| Rest]) ->
    is_proplist(Rest);
is_proplist(_) ->
    false.
