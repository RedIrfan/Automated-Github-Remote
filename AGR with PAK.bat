@echo off & setlocal
cls

echo "+-------------[AGR]-------------+"
echo "|    AUTOMATED GITHUB REMOTE    |"
echo "|                               |"
echo "| with personal access key      |"
echo "+-------------------------------+"
echo "| made by redfan                |"
echo "+-------------------------------+"

rem get the path to where you put your folder
set /p folder_path="insert your local folder : "

cd %folder_path%

rem for the goto function
:start

set /p github_name="insert your github name: "
set /p github_email="insert your github email: "
set /p github_pak="insert your personal access key: "
set /p github_repo="insert your github repository: "
set /p remote_name="insert your remote name: "

rem Connect the github account to this computer
git config --global user.name "%github_name%"
git config --global user.email "%github_email%"

rem Split Github repository strings to get the path without the character "/"
for /F "tokens=1,2,3,4 delims=/" %%a in ("%github_repo%") do (
	set https=%%a
	set webpath=%%b
	set github_repo_user=%%c
	set repo_name=%%d
)

rem add all of the webpath together to create a path that uses a personal access key
set full_modified_webpath="%https%//%github_name%:%github_pak%@%webpath%/%github_repo_user%/%repo_name%"

echo "this is the modified webpath : %full_modified_webpath%"

set /p confirm_remote="is that right? (press anything to continue)"

git remote add %remote_name% %full_modified_webpath%
	
echo done.

pause