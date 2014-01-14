# Customizations in vim for asciidoc

## Commands

`:Arev` create/edit a revision history file for the ascii doc

`:Abuild` build the pdf document from he ascii doc

`:Ashow` show the pdf output

## Revision history file snippets

In insert mode in the revision file,

```
re<tab>

rentry<tab>

reventry<tab>
```

create a new revision entry snippet.

## Syntax

From the standard asciidoc package.

## Table of contents with tagbar

Needs some additional information in `~/.ctags` or `%UserProfile%\ctags.cnf` :

```
--langdef=asciidoc
--langmap=asciidoc:.ad.adoc.asciidoc
--regex-asciidoc=/^=[ \t]+(.*)/# \1/s,Section_L0/
--regex-asciidoc=/^==[ \t]+(.*)/. \1/s,Section_L1/
--regex-asciidoc=/^===[ \t]+(.*)/. . \1/s,Section_L2/
--regex-asciidoc=/^====[ \t]+(.*)/. . . \1/s,Section_L3/
--regex-asciidoc=/^=====[ \t]+(.*)/. . . . \1/s,Section_L4/
```

## Shortcuts

You may want to add this in your `.vimrc` :

```
nnoremap <leader>r :call Arev()<cr>
nnoremap <leader>s :call Ashow()<cr>
nnoremap <leader>b :call Abuild()<cr>
```
