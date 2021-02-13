latexmk -C

for %%f in (*.tex) do (
    rem echo %%f
    arara %%f
)
