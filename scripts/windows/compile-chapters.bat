cd chapters

REM https://stackoverflow.com/a/9429985/6505634
for /F %%x in ('dir /B *.tex') do (
	arara %%x
)

cd ..
