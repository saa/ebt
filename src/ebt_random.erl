-module(ebt_random).

-export([string/1]).
-export([string/2]).
-export([numbers/2]).

string(Len) ->
    Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            "abcdefghijklmnopqrstuvwxyz"
            "0123456789",
    string(Len, Chars).

string(Len, Chars) ->
    Chrs = list_to_tuple(Chars),
    ChrsSize = size(Chrs),
    F = fun(_, R) ->
                [element(crypto:rand_uniform(Len, ChrsSize), Chrs) | R] end,
    lists:foldl(F, "", lists:seq(1, Len)).

numbers(N, Max) -> [crypto:rand_uniform(0, Max) || _ <- lists:seq(1, N)].
