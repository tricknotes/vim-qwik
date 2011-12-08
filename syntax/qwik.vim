" Vim syntax file
" Language:    Qwik
" Maintainer:  Ryunosuke SATO <tricknotes.rs@gmail.com>
" Filenames:   *.qwik

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn sync minlines=10
syn case ignore

syn match qwikLineStart "^[<@]\@!" nextgroup=@qwikBlock

syn cluster qwikBlock contains=qwikH1,qwikH2,qwikH3,qwikH4,qwikH5,qwikH6,qwikBlockquote,qwikListMarker,qwikOrderedListMarker,qwikCodeBlock,qwikRule,qwikTableComma,qwikTablePipe
syn cluster qwikInline contains=qwikItalicBold,qwikBold,qwikCode,qwikIdLink,qwikPlugin

syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^!\{1\}[^!]"  keepend end="$"
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^!\{2\}[^!]"  keepend end="$"
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^!\{3\}[^!]"  keepend end="$"
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^!\{4\}[^!]"  keepend end="$"
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^!\{5\}[^!]"  keepend end="$"
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^!\{6\}[^!]"  keepend end="$"
syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^\*\{1\}[^*]" keepend end="$"
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^\*\{2\}[^*]" keepend end="$"
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^\*\{3\}[^*]" keepend end="$"
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^\*\{4\}[^*]" keepend end="$"
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^\*\{5\}[^*]" keepend end="$"
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^\*\{6\}[^*]" keepend end="$"

syn match qwikBlockquote contained ">\s" nextgroup=@qwikBlock

syn region qwikCodeBlock contained start="^ \|^\t" end="$"

syn match qwikListMarker contained "-\{1,3\}\%(\s\+\S\)\@="
syn match qwikOrderedListMarker contained "+\{1,3\}\%(\s\+\S\)\@="

syn match qwikRule contained "^[=-]\{4\}$"
syn match qwikRule contained "^-- $"

syn region qwikIdLink start=+\[\[+ keepend end=+]]+ oneline contains=qwikId,qwikLink
syn region qwikId contained start=+\[\[+ms=s+2 keepend end=+]]+me=s-1 oneline
syn region qwikId contained start=+\[\[+ms=s+2 keepend end=+|+me=s-1 oneline
syn region qwikLink contained start=+|+ms=s+1 keepend end=+]]+me=s-1 oneline

syn region qwikWord start=+^:[^:]*+ keepend end=+:+ oneline contains=qwikWordHead,qwikWordSep
syn region qwikWordHead contained start=+[^:]*+ keepend end=++ oneline
syn region qwikWordSep contained start=+:+ end=++ oneline

syn region qwikTableComma start=+^,+ keepend end=+$+ oneline contains=qwikTableCommaNode
syn region qwikTableCommaNode contained start=+,+ keepend end=++ oneline
syn region qwikTablePipe start=+^|+ keepend end=+$+ oneline contains=qwikTablePipeNode
syn region qwikTablePipeNode contained start=+|+ keepend end=++ oneline

syn region qwikDel matchgroup=qwikCodeDelimiter start="==" keepend end="==" oneline
syn region qwikBold matchgroup=qwikCodeDelimiter start="''" keepend end="''" oneline contains=qwikLineStart
syn region qwikItalicBold matchgroup=qwikCodeDelimiter start="'''" keepend end="'''" oneline contains=qwikLineStart

syn region qwikCode matchgroup=qwikCodeDelimiter start="^{{{$" keepend end="^}}}$"

syn region qwikPlugin matchgroup=qwikCodeDelimiter start="{{" keepend end="}}" oneline contains=qwikLineStart

syn region qwikComment start="^#" keepend end="$"

hi def link qwikH1                    htmlH1
hi def link qwikH2                    htmlH2
hi def link qwikH3                    htmlH3
hi def link qwikH4                    htmlH4
hi def link qwikH5                    htmlH5
hi def link qwikH6                    htmlH6
hi def link qwikHeadingRule           qwikRule
hi def link qwikHeadingDelimiter      Delimiter
hi def link qwikOrderedListMarker     qwikListMarker
hi def link qwikListMarker            htmlTagName
hi def link qwikBlockquote            Comment
hi def link qwikRule                  PreProc

hi def link qwikIdLink                htmlTagName
hi def link qwikId                    htmlTag
hi def link qwikLink                  htmlLink

hi def link qwikWordHead              htmlBold
hi def link qwikWordSep               htmlTagName

hi def link qwikTableCommaNode        htmlTAgName
hi def link qwikTablePipeNode         htmlTAgName

hi def link qwikBold                  htmlBold
hi def link qwikItalicBold            htmlItalicBold
hi def link qwikCodeDelimiter         Delimiter

hi def link qwikPlugin                htmlTagName

hi def link qwikComment               Comment

let b:current_syntax = "qwik"

" vim:set sw=2:
