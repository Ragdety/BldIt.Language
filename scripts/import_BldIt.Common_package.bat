@echo off

setlocal enabledelayedexpansion

set packagesPath=C:\Users\ragde\OneDrive\Desktop\Programming\BldIt\BldIt\src\packages\
set packageSourceName=BldItLocalPackages
set commonBldItPackageName=BldIt.Common
set BldItLangProjectName=BldIt.Lang

dotnet nuget add source %packagesPath% -n %packageSourceName%
if [!errorlevel!] equ [1] (
    echo ERROR: Failed to add source %packageSourceName% to nuget sources
    echo INFO: Trying to add %commonBldItPackageName% package to %BldItLangProjectName% project
)

pushd "../src/%BldItLangProjectName%"
dotnet add package %commonBldItPackageName%

echo %errorlevel%
exit /b %errorlevel% 