-module(ebt_convert).

-export([to_a/1]).
-export([to_b/1]).
-export([to_l/1]).
-export([to_i/1]).
-export([can_i/1]).

to_a(Val) when is_integer(Val) ->
    list_to_atom(integer_to_list(Val));
to_a(Val) when is_atom(Val) ->
    Val;
to_a(Val) when is_list(Val) ->
    list_to_atom(Val);
to_a(Val) when is_binary(Val) ->
    binary_to_atom(Val, utf8).


to_b(V) when is_list(V) ->
    list_to_binary(V);
to_b(V) when is_integer(V) ->
    to_b(integer_to_list(V));
to_b(V) when is_atom(V) ->
    to_b(atom_to_list(V));
to_b(V) when is_binary(V) ->
    V.

to_l(V) when is_integer(V) ->
    integer_to_list(V);
to_l(V) when is_binary(V) ->
    binary_to_list(V);
to_l(V) when is_atom(V) ->
    atom_to_list(V);
to_l(V) when is_list(V) ->
    V.

to_i(V) when is_list(V) ->
    list_to_integer(V);
to_i(V) when is_binary(V) ->
    binary_to_integer(V);
to_i(V) when is_atom(V) ->
    list_to_integer(atom_to_list(V));
to_i(V) when is_integer(V) ->
    V.

can_i(V) when is_list(V) ->
    try
        _ = list_to_integer(V),
        true
    catch error:badarg ->
        false
    end;
can_i(V) when is_binary(V) ->
    can_i(binary_to_list(V));
can_i(V) when is_atom(V) ->
    can_i(atom_to_list(V));
can_i(V) when is_integer(V) ->
    true.
