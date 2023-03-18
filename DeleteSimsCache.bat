@echo off

::Change folderpath in case the script can't find the folder
set folderpath="%UserProfile%\Documents"
::Change showMessages to false if you don't want to see the message pop-up
set showMessages=true

::Check if the folder exists
if exist "%folderpath%\Electronic Arts\The Sims 4\cachestr\" (
	DEL /q /F "%folderpath%\Electronic Arts\The Sims 4\localthumbcache.package"
	DEL /q /F "%folderpath%\Electronic Arts\The Sims 4\cachestr\*.*"
	DEL /q /F "%folderpath%\Electronic Arts\The Sims 4\cache\*.*"
	DEL /q /F "%folderpath%\Electronic Arts\The Sims 4\onlinethumbnailcache\*.*"
	set message=Sims 4 Cache has been deleted successfully
		if [%showMessages%]==[true] (
			goto sendMessage
		) else (
			exit
		)
)

::Check if folder is located in the onedrive of the user
if exist "C:\Users\%UserProfile%\OneDrive\Documents\Electronic Arts\The Sims 4\cachestr\" (
	DEL /q /F "C:\Users\%UserProfile%\OneDrive\Documents\Electronic Arts\The Sims 4\localthumbcache.package"
	DEL /q /F "C:\Users\%UserProfile%\OneDrive\Documents\Electronic Arts\The Sims 4\cachestr\*.*"
	DEL /q /F "C:\Users\%UserProfile%\OneDrive\Documents\Electronic Arts\The Sims 4\cache\*.*"
	DEL /q /F "C:\Users\%UserProfile%\OneDrive\Documents\Electronic Arts\The Sims 4\onlinethumbnailcache\*.*"
	set message=Sims 4 Cache has been deleted successfully
		if [%showMessages%]==[true] (
			goto sendMessage
		) else (
			exit
		)
) else (
	set message=Sims 4 Cache folder has not been found
		if [%showMessages%]==[true] (
			goto sendMessage
		) else (
			exit
		)
)

::goto's
:sendMessage
echo.
echo %message%
echo.
PAUSE
