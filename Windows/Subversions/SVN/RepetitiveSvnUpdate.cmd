title Repetitive Svn Update...
echo Repetitive Svn Update...
cd directory_with_code
:loo
::pause
echo update
date /t
time /t
svn update && goto exi
echo cleanup
date /t
time /t
svn cleanup
goto loo
:exi
echo success
pause 