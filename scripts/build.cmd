@echo off

cd %~dp0
cd ../

echo :: Clean repo
call git clean -fdx > nul
echo Done

echo :: Fetch latest changes
call git pull --rebase > nul
echo Done

echo :: Yarn install
call yarn > nul
echo Done

echo :: Build Hyper
call yarn dist > nul
echo Done

echo :: Copy win-unpacked folder to tools folder
call robocopy ./dist/win-unpacked D:/tools/Hyper /MIR /XD > nul
echo Done!