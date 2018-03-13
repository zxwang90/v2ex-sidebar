@ECHO off

SET CHROME_PATH="C:\Program Files (x86)\Google\Chrome\Application"
SET PROJECT_NAME=v2ex-sidebar

IF NOT EXIST %PROJECT_NAME% GOTO mkdir
RMDIR /S /Q %PROJECT_NAME%
:mkdir
MD %PROJECT_NAME%

XCOPY /E /H /Q /EXCLUDE:exclude.txt "%CD%\..\src" "%CD%\%PROJECT_NAME%\"

:package
IF NOT EXIST %CHROME_PATH% GOTO notchrome
IF NOT EXIST %CD%\%PROJECT_NAME%.pem GOTO new
:update
%CHROME_PATH%\chrome.exe --pack-extension=%CD%\%PROJECT_NAME% --pack-extension-key=%CD%\%PROJECT_NAME%.pem
GOTO exit

:new
%CHROME_PATH%\chrome.exe --pack-extension=%CD%\%PROJECT_NAME%
GOTO exit

:notchrome
ECHO %CHROME_PATH% 不存在，请编辑本脚本的 CHROME_PATH 变量，更正本机的Chrome安装路径
PAUSE
GOTO exit

:err
ECHO 打包错误，错误码：%ERRORLEVEL%
PAUSE
GOTO exit

:exit
RMDIR /S /Q %PROJECT_NAME%