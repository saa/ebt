-module(ebt_http_tests).

-include_lib("eunit/include/eunit.hrl").

parse_accept_language_test() ->
    Expected = [#{ language => <<"en">>, region => <<"US">>, quality => <<"1.0">> }],
    ?assertEqual(Expected, ebt_http:parse_accept_language(<<"en-US">>)),

    Expected2 = [#{ language => <<"en">>, region => <<"US">>, quality => <<"1.0">> },
                 #{ language => <<"ru">>, quality => <<"0.8">>}],
    ?assertEqual(Expected2, ebt_http:parse_accept_language(<<"en-US,ru;q=0.8">>)),

    Expected3 = [#{ language => <<"*">>, quality => <<"1.0">>}],
    ?assertEqual(Expected3, ebt_http:parse_accept_language(<<"*">>)),

    Expected4 = [#{ language => <<"ja">>, script => <<"Hant">>, region => <<"JP">>, quality => <<"1.0">> }],
    ?assertEqual(Expected4, ebt_http:parse_accept_language(<<"ja-Hant-JP">>)),

    Expected5 = [#{ language => <<"en">>, region => <<"US">>, quality => <<"1.0">> },
                 #{ language => <<"ru">>, quality => <<"0.8">>},
                 #{ language => <<"en">>, quality => <<"0.6">>}],
    ?assertEqual(Expected5, ebt_http:parse_accept_language(<<"en-US,ru;q=0.8,en;q=0.6">>)).
