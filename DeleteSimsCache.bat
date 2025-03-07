@echo off

:: Change folderpath in case the script can't find the folder
set folderpath="%UserProfile%\Documents"
:: Change showMessages to true if you want to see the message pop-up
set showMessages=true
:: Variable used to check if at least one file got deleted. Do NOT manually change value
set somethingDeleted=false

goto :main

:: Function to delete files and check if they exist
:deleteFiles
if exist %1 (
	DEL /q /F %1
	set somethingDeleted=true
) else (
	echo [31mFile or folder not found: %1[0m
)
EXIT /B

:: Check if the folder exists and delete files from custom folder path
:main
if exist "%folderpath%\Electronic Arts\The Sims 4" (
	call :deleteFiles "%folderpath%\Electronic Arts\The Sims 4\localthumbcache.package"
	call :deleteFiles "%folderpath%\Electronic Arts\The Sims 4\localsimtexturecache.package"
	call :deleteFiles "%folderpath%\Electronic Arts\The Sims 4\cachestr\*.*"
	call :deleteFiles "%folderpath%\Electronic Arts\The Sims 4\cache\*.*"
	call :deleteFiles "%folderpath%\Electronic Arts\The Sims 4\onlinethumbnailcache\*.*"
) else (
	echo [41;30mSims 4 Documents folder path not found: %folderpath%\Electronic Arts\The Sims 4[0m
)

:: Report results based on whether files were deleted
if [%somethingDeleted%]==[true] (
	set message=[4;92m'Sims 4 Cache Deletion Batch File' File has ran successfully[0m
) else (
	set message=[41;30mSomething went wrong with running the 'Sims 4 Cache Deletion Batch File'[0m
)

:: Display message if showMessages is true
if [%showMessages%]==[true] (
	goto sendMessage
) else (
	exit
)

:: goto's
:sendMessage
echo.
echo %message%
echo.
PAUSE
