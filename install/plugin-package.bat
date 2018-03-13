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
ECHO %CHROME_PATH% �����ڣ���༭���ű��� CHROME_PATH ����������������Chrome��װ·��
PAUSE
GOTO exit

:err
ECHO ������󣬴����룺%ERRORLEVEL%
PAUSE
GOTO exit

:exit
RMDIR /S /Q %PROJECT_NAME%