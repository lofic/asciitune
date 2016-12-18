" Author:       Louis Coilliot <louis.coilliot@gmail.com>

" setl ft will override any previous setfiletype
autocmd BufNewFile,BufRead *.asciidoc,*.txt setl ft=asciidoc
command Ad setfiletype asciidoc

" Show the table of contents in the tagbar
let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds'     : [
    \     's:Table of Contents'
    \ ],
    \ 'sort'    : 0
    \ }

" Create/Edit revision history file for an asciidoc
function! Arev()
  execute 'e %:r-docinfo.xml'
  endfunction
command! -bar -range=% Rev call Arev()
command! -bar -range=% Arev call Arev()

" Build the pdf document
function! Abuild()
  execute '!' . 'a2x -a docinfo -fpdf -L --dblatex-opts=" -s ~/.vim/bundle/asciitune/sty/custom.sty" --icons --icons-dir=/usr/share/asciidoc/icons ' . bufname("%")
endfunction
command! -bar -range=% Abuild call Abuild()

" Build the pdf document - minimalistic
function! Amin()
  execute '!' . 'a2x -a docinfo -fpdf -L --dblatex-opts=" -P doc.layout=\"mainmatter\" -P doc.publisher.show=0 -s ~/.vim/bundle/asciitune/sty/custom.sty" --icons --icons-dir=/usr/share/asciidoc/icons ' . bufname("%")
endfunction
command! -bar -range=% Amin call Amin()

" Show the pdf output
function! Ashow()
  execute '!' . 'evince ' . expand("%:r") . '.pdf &'
endfunction
command! -bar -range=% Ashow call Ashow()
command! -bar -range=% Asee  call Ashow()

