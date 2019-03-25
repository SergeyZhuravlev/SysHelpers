::cd directory_with_code
title Waiting for push available by pull merge...
echo Waiting for push available by pull merge...
cd
git branch -D z/AutoBackupBranchBeforePull2920
git branch z/AutoBackupBranchBeforePull2920 || goto backupFailed
:waitingLoop
(git pull || goto pullFailed) && git push && goto success
timeout /T 30
goto waitingLoop
:backupFailed
echo Branch backup failed.
pause
exit
:pullFailed
echo Pull failed. We are sorry.
pause
exit
:success
echo Pushed (:
pause
exit