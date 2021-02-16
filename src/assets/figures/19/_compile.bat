@echo off

for %%f in (*.tex) do (
    rem echo %%f
    arara %%f
)
