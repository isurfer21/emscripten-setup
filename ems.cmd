@echo off
setlocal
set ems_bin_path=%EMSDK%\upstream\emscripten
set ems_self=%~n0
set ems_cmd=%1
if "%ems_cmd%" == "" (
  echo Usage: %ems_self% executable [arguments]
  exit /b 1
)
if not exist "%ems_bin_path%\%ems_cmd%.bat" (
  echo Error: %ems_cmd% is not a valid executable in %ems_bin_path%
  exit /b 2
)
shift
%ems_bin_path%\%*
