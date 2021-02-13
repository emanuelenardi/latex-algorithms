call "%~dp0\reset-project.bat"
call "%~dp0\compile-preambles.bat"

echo(
echo COMPILO IL MAIN
echo(
arara main
