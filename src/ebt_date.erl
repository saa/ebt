-module(ebt_date).

-export([date_str_ru/0]).

date_str_ru() ->
    Months = #{
        1 => " января ",
        2 => " февраля ",
        3 => " марта ",
        4 => " апреля ",
        5 => " мая ",
        6 => " июня ",
        7 => " июля ",
        8 => " августа ",
        9 => " сентября ",
        10 => " октября ",
        11 => " ноября ",
        12 => " декабря "
       },
    {{Y, M, D}, _} = erlang:localtime(),
    unicode:characters_to_binary(integer_to_list(D) ++ maps:get(M, Months) ++ integer_to_list(Y)).
