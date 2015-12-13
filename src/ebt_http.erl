-module(ebt_http).

-export([parse_accept_language/1]).

%%====================================================================
%% API
%%====================================================================

%% @doc Parse Accept-Language header
-spec parse_accept_language(AcceptLanguage) -> Result when
        AcceptLanguage :: binary(),
        Result         :: [map()].

parse_accept_language(AcceptLanguage) ->
    Langs = [begin
                 case binary:split(L, <<";">>, [global]) of
                     [Lang] -> #{ language => Lang, quality => <<"1.0">> };
                     [Lang, <<_H:2/binary, Q/binary>> ] -> #{ language => Lang, quality => Q}
                 end
             end || L <- binary:split(AcceptLanguage, <<",">>, [global])],
    [begin
         case binary:split(maps:get(language, L), <<"-">>, [global]) of
             [_Lang] -> L;
             [<<"*">>, <<_Region:2/binary>>] -> L#{ language => <<"*">> };
             [<<"*">>, Script] -> L#{ language => <<"*">>, script => Script };
             [<<"*">>, Script, _Region] -> L#{ language => <<"*">>, script => Script };
             [Lang, <<Region:2/binary>>] -> L#{ language => Lang, region => Region };
             [Lang, <<"*">>, Region] -> L#{ language => Lang, region => Region };
             [Lang, Script, <<"*">>] -> L#{ language => Lang, script => Script };
             [Lang, Script, Region] -> L#{ language => Lang, script => Script, region => Region }
         end
     end || L <- Langs].
