-module(ebt_lists).

-export([ensure_list/1]).


ensure_list(List) when is_list(List) ->
    List;
ensure_list(NotList) ->
    [NotList].
