-module(ebt_log).

-export([debug/1]).
-export([info/1]).
-export([notice/1]).
-export([warning/1]).
-export([error/1]).
-export([critical/1]).
-export([alert/1]).
-export([emergency/1]).
-export([debug/2]).
-export([info/2]).
-export([notice/2]).
-export([warning/2]).
-export([error/2]).
-export([critical/2]).
-export([alert/2]).
-export([emergency/2]).

debug(Fmt) -> debug(Fmt, []).
debug(Fmt, Args) -> lager:debug(Fmt, Args).

info(Fmt) -> info(Fmt, []).
info(Fmt, Args) -> lager:info(Fmt, Args).

notice(Fmt) -> notice(Fmt, []).
notice(Fmt, Args) -> lager:notice(Fmt, Args).

warning(Fmt) -> warning(Fmt, []).
warning(Fmt, Args) -> lager:warning(Fmt, Args).

error(Fmt) -> ebt_log:error(Fmt, []).
error(Fmt, Args) -> lager:error(Fmt, Args).

critical(Fmt) -> critical(Fmt, []).
critical(Fmt, Args) -> lager:critical(Fmt, Args).

alert(Fmt) -> alert(Fmt, []).
alert(Fmt, Args) -> lager:alert(Fmt, Args).

emergency(Fmt) -> emergency(Fmt, []).
emergency(Fmt, Args) -> lager:emergency(Fmt, Args).
