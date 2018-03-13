@ECHO off

SET OUTPUT=v2ex-sidebar

IF NOT EXIST %OUTPUT% GOTO noiAsst
RMDIR /S /Q %OUTPUT%
:noiAsst

IF NOT EXIST %OUTPUT%.crx GOTO nocrx
DEL /S /Q /F %OUTPUT%.crx
:nocrx