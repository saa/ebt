-module(ebt_lists).

-export([ensure_list/1]).
-export([is_proplist/1]).
-export([intersection/2]).
-export([diff/2]).

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

intersection(List1, List2) when length(List1) < length(List2) ->
    lists:filter(fun (Element) -> lists:member(Element, List2) end, List1);
intersection(List1, List2) ->
    lists:filter(fun (Element) -> lists:member(Element, List1) end, List2).

diff(List1, List2) when length(List1) < length(List2) ->
    lists:filter(fun (Element) -> not lists:member(Element, List2) end, List1);
diff(List1, List2) ->
    lists:filter(fun (Element) -> not lists:member(Element, List1) end, List2).
