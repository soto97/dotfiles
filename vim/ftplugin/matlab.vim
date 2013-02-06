" Vim filetype plugin file
" Language:	matlab
" Maintainer:	Fabrice Guy <fabrice.guy at gmail dot com>
" Modifier:	Yaroslav Don
" Last Changed: 2010 May 19
"               2010 Sep 19 : support for additional mappings for matlab files
"               2011 Feb 09 : added enumeration and descriptions

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo-=C

setlocal fo+=croql
"setlocal fo+=tcql
setlocal comments=:%>,:%

if exists("loaded_matchit")
  let s:conditionalEnd = '\([-+{\*\:(\/\[]\s*\)\@<!\<end\>\(\s*[-+}\:\*\/)\]]\)\@!'
  let b:match_words = '\<classdef\>\|\<methods\>\|\<events\>\|\<properties\>\|\<enumeration\>\|\<if\>\|\<while\>\|\<for\>\|\<switch\>\|\<try\>\|\<function\>:' . s:conditionalEnd
endif

setlocal suffixesadd=.m
setlocal suffixes+=.asv
setlocal suffixes+=.m~   " YD

" use additional mappings for matlab files
for m in ['n', 'v', 'o']
  execute m.'map <silent> <buffer> [[ :<C-U>call <SID>Matlab_Jump( ''\<function\>'',   ''Function\\|Statement'', "bW",  "'.m.'" )<CR>'
  execute m.'map <silent> <buffer> ]] :<C-U>call <SID>Matlab_Jump( ''\<function\>'',   ''Function\\|Statement'', "W",   "'.m.'" )<CR>'
  execute m.'map <silent> <buffer> [] :<C-U>call <SID>Matlab_Jump( ''\<end\>'',        ''Function\\|Statement'', "bW",  "'.m.'" )<CR>'
  execute m.'map <silent> <buffer> ][ :<C-U>call <SID>Matlab_Jump( ''\<end\>'',        ''Function\\|Statement'', "W",   "'.m.'" )<CR>'
  execute m.'map <silent> <buffer> [t :<C-U>call <SID>Matlab_Jump( ''%%\%(\s\\|$\)'',  ''Title'',                "bW",  "'.m.'" )<CR>'
  execute m.'map <silent> <buffer> ]t :<C-U>call <SID>Matlab_Jump( ''%%\%(\s\\|$\)'',  ''Title'',                "W",   "'.m.'" )<CR>'
endfor

map <silent> <buffer> <C-Up>   [t
map <silent> <buffer> <C-Down> ]t



" Change the :browse e filter to primarily show M-files
if has("gui_win32") && !exists("b:browsefilter")
  let  b:browsefilter="M-files (*.m)\t*.m\n" .
	\ "All files (*.*)\t*.*\n"
endif

let b:undo_ftplugin = "setlocal suffixesadd< suffixes< "
      \ . "| unlet! b:browsefilter"
      \ . "| unlet! b:match_words"

let &cpo = s:save_cpo


" Matlab Search function for matlabTitle-s and matlabFunction-s
" Based on "searchsyn" in ruby.vim ftplugin (YD)
if exists('*<SID>Matlab_Jump') | finish | endif
"
" define jumps for the previously defined mappings
" TODO: unexpected behaviour for [] and ][ mappings

function! <SID>Matlab_Jump(pattern,syn,flags,mode)
  mark '                 " mark start
  let cnt = v:count1     " set count
  if a:mode=='v' | execute "normal gv" | endif " start a visible range, if exist
  " repeat (count) times
  for i in range(cnt)
    let line =  line('.')
    let col  =  col('.')
    let pos  =  search(a:pattern,a:flags)
    " search for the appropriate group name
    while pos != 0 && s:synname() !~# 'matlab\%('.a:syn.'\)'
      let pos = search(a:pattern,a:flags)
    endwhile
    " return to initial position if group weren't found
    if pos == 0
      call cursor(line,col)
      return
    endif
  endfor
endfunction

"
" return current syntax-group name
function! s:synname()
  return synIDattr(synID(line('.'),col('.'),0),'name')
endfunction

" vim: nowrap sw=2 sts=2 ts=8:
