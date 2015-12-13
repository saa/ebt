-module(ebt_crypto).

-export([hash/2]).

%%====================================================================
%% API
%%====================================================================

-spec hash(Type::crypto:hash_algorithms(), iodata()) -> binary().
hash(Type, Data) ->
    ebt_convert:to_b(lists:flatten([io_lib:format("~2.16.0b", [B]) || <<B>> <= crypto:hash(Type, Data)])).
