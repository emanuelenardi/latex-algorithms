$pdflatex = "pdflatex --shell-escape -synctex=1 -halt-on-error %O %S";
$sleep_time = 1; # 1 second
$pdf_mode = 1; # tex -> pdf

@default_files = ('03-funzioni.tex');
@generated_exts = (@generated_exts, 'fof');
#@generated_exts = (@generated_exts, 'fof', 'synctex.gz');
#$clean_ext = "bbl nav out snm";
