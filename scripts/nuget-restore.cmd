@echo off
rem initiate the retry number
set retryNumber=0
set maxRetries=3

:RESTORE
nuget restore %*

rem problem?
@echo Nuget restore exited with code %ERRORLEVEL%
IF NOT ERRORLEVEL 1 GOTO :EOF
@echo Retrying
set /a retryNumber=%retryNumber%+1
IF %reTryNumber% LSS %maxRetries% (GOTO :RESTORE)
@echo Sorry, we tried restoring nuget packages for %maxRetries% times and all attempts were unsuccessful!
EXIT /B 1
