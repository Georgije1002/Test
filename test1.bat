@echo off
echo Here are the files to be deleted:>tmp
set dirc1=%dircmd%
set dircmd=
dir /a-d %1 | find /v " Volume " | find /v "dir(s)" | find /v "Directory of" | find " " >> tmp
set dircmd=%dirc1%
set dirc1=
type tmp|more
choice Are you sure 
if errorlevel 2 goto DoNotDel
if errorlevel 1 goto KillThem
rem The following is just in case
rem "choice" does something unexpected ...
echo Something else happened!
goto end

:KillThem
rem Here's where we would put the "del" command
echo They are gone.
goto end

:DoNotDel
echo They are still there.
:end
