$pdflatex = "pdflatex --shell-escape -synctex=1 -halt-on-error %O %S";
@generated_exts = (@generated_exts, 'synctex.gz');

$sleep_time = 1; # 1 second
$pdf_mode = 1;   # tex -> pdf

@default_files = ('main.tex');
$clean_ext = "loc soc pyg";
