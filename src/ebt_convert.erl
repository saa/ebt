-module(ebt_convert).

-export([to_b/1]).
-export([to_l/1]).
-export([to_i/1]).

to_b(V) when is_list(V) ->
    list_to_binary(V);
to_b(V) when is_integer(V) ->
    to_b(integer_to_list(V));
to_b(V) when is_atom(V) ->
    to_b(atom_to_list(V)).

to_l(V) when is_integer(V) ->
    integer_to_list(V);
to_l(V) when is_binary(V) ->
    binary_to_list(V);
to_l(V) when is_atom(V) ->
    atom_to_list(V).

to_i(V) when is_list(V) ->
    list_to_integer(V);
to_i(V) when is_binary(V) ->
    binary_to_integer(V);
to_i(V) when is_atom(V) ->
    list_to_integer(atom_to_list(V)).
