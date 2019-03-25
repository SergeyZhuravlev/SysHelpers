::cd directory_with_code
title Waiting for push available by pull rebase...
echo Waiting for push available by pull rebase...
cd
git branch -D z/AutoBackupBranchBeforePullRebase2920
git branch z/AutoBackupBranchBeforePullRebase2920 || goto backupFailed
:waitingLoop
(git pull --rebase || goto rebaseFailed) && git push && goto success
timeout /T 30
goto waitingLoop
:backupFailed
echo Branch backup failed.
pause
exit
:rebaseFailed
echo Rebase failed. We will try aborting "git pull --rebase". Try aborting by:
pause
(git rebase --abort || del .git/rebase-apply) && git reset --hard z/AutoBackupBranchBeforePullRebase2920 && echo Aborting rebase probably success. && pause && exit
echo Aborting rebase failed.
pause
exit
:success
echo Pushed (:
pause
exit 