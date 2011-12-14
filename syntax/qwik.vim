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

syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^!\{1\}[^!]"  keepend end="$"
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^!\{1\}[^!]"  keepend end="$"
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^!\{2\}[^!]"  keepend end="$"
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^!\{3\}[^!]"  keepend end="$"
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^!\{4\}[^!]"  keepend end="$"
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^!\{5\}[^!]"  keepend end="$"
syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^\*\{1\}[^*]" keepend end="$"
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^\*\{1\}[^*]" keepend end="$"
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^\*\{2\}[^*]" keepend end="$"
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^\*\{3\}[^*]" keepend end="$"
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^\*\{4\}[^*]" keepend end="$"
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^\*\{5\}[^*]" keepend end="$"
syn cluster qwikHeader contains=qwikH1,qwikH2,qwikH3,qwikH4,qwikH5,qwikH6

syn region qwikBlockquote start="^>" end="$" oneline contains=qwikQuote,@qwikInnerList,qwikIdLink,@qwikSpecifiedString
syn region qwikCodeBlock start="^ " end="$" oneline
syn region qwikCodeBlock start="^\t" end="$" oneline
syn region qwikQuote contained start="^>" end="" oneline
syn cluster qwikBlock contains=qwikBlockquote,qwikCodeBlock
syn region qwikInnerListMarker contained start="-\{1,3\}" end="" oneline
syn region qwikInnerOrderedListMarker contained start="+\{1,3\}" end="" oneline
syn cluster qwikInnerList contains=qwikInnerListMarker,qwikInnerOrderedListMarker

syn region qwikListMarker start="^-\{1,3\}\%(\s\+\S\)\@=" end="" oneline contains=qwikIdLink,@qwikSpecifiedString
syn region qwikOrderedListMarker start="^+\{1,3\}\%(\s\+\S\)\@=" end="" oneline contains=qwikIdLink,@qwikSpecifiedString
syn cluster qwikList contains=qwikListMarker,qwikOrderedListMarker

syn match qwikRule "^=\{4,\}$"
syn match qwikRule "^-\{4,\}$"
syn match qwikRule "^-- $"

syn region qwikIdLink start="\[\[" keepend end="]]" oneline contains=qwikId,qwikLink
syn region qwikId contained start="\[\["ms=s+2 keepend end="]]"me=s-1 oneline
syn region qwikId contained start="\[\["ms=s+2 keepend end="|"me=s-1 oneline
syn region qwikLink contained start="|"ms=s+1 keepend end="]]"me=s-1 oneline

syn region qwikWord start="^:[^:]*" keepend end=":" oneline contains=qwikWordHead,qwikWordSep
syn region qwikWordHead contained start="[^:]*" keepend end="" oneline
syn region qwikWordSep contained start=":" end="" oneline

syn region qwikTableComma start="^," keepend end="$" oneline contains=qwikIdLink,qwikTableCommaNode,@qwikSpecifiedString
syn region qwikTableCommaNode contained start="," keepend end="" oneline
syn region qwikTablePipe start="^|" keepend end="$" oneline contains=qwikIdLink,qwikTablePipeNode,@qwikSpecifiedString
syn region qwikTablePipeNode contained start="|" keepend end="" oneline
syn cluster qwikTable contains=qwikTableComma,qwikTablePipe

syn region qwikDel start="==[^=]" keepend end="==" oneline contains=qwikDelText
syn region qwikDelText contained start="==" keepend end="" oneline
syn region qwikBold matchgroup=qwikCodeDelimiter start="''" keepend end="''" oneline
syn region qwikItalicBold matchgroup=qwikCodeDelimiter start="'''" keepend end="'''" oneline
syn cluster qwikSpecifiedString contains=qwikDel,qwikBold,qwikItalicBold

syn cluster qwikContent contains=@qwikHeader,@qwikBlock,@qwikList,qwikRule,qwikIdLink,qwikWord,qwikTable,@qwikSpecifiedString,qwikCode,qwikComment

syn region qwikPlugin start="[^{]{{[^{]" keepend end="}}" oneline contains=qwikPluginContent,qwikPluginBracketEnd
syn region qwikPlugin start="^{{[^{]" keepend end="^}}$" contains=qwikPluginContent,@qwikContent,qwikPluginBracketEnd
syn region qwikPluginContent contained start="{{[^(]*(" keepend end=")" oneline contains=qwikPluginBracketStart,qwikPluginName,qwikPluginValue
syn region qwikPluginName contained start="" end="("me=e-1
syn region qwikPluginValue matchgroup=qwikPluginOperator contained start="(" end=")" contains=qwikPluginSep
syn region qwikPluginSep matchgroup=qwikPluginOperator contained start="," end="" oneline
syn region qwikPluginBracketStart matchgroup=qwikPluginOperator contained start="{{" end="" oneline
syn region qwikPluginBracketEnd matchgroup=qwikPluginOperator contained start="}}" end="" oneline

syn region qwikCode matchgroup=qwikCodeDelimiter start="^{{{$" keepend end="^}}}$"

syn region qwikComment start="^#" keepend end="$"

hi def link qwikH1                    htmlH1
hi def link qwikH2                    htmlH2
hi def link qwikH3                    htmlH3
hi def link qwikH4                    htmlH4
hi def link qwikH5                    htmlH5
hi def link qwikH6                    htmlH6
hi def link qwikHeadingDelimiter      Delimiter
hi def link qwikListMarker            htmlTagName
hi def link qwikOrderedListMarker     htmlTagName
hi def link qwikInnerListMarker       qwikListMarker
hi def link qwikInnerOrderedListMarker  qwikListMarker
hi def link qwikQuote                 Comment
hi def link qwikRule                  htmlTag

hi def link qwikIdLink                htmlTagName
hi def link qwikId                    htmlLink
hi def link qwikLink                  String

hi def link qwikWordHead              htmlBold
hi def link qwikWordSep               htmlTagName

hi def link qwikTableCommaNode        htmlTagName
hi def link qwikTablePipeNode         htmlTagName

hi def link qwikDelText               Delimiter
hi def link qwikBold                  htmlBold
hi def link qwikItalicBold            htmlItalicBold
hi def link qwikCodeDelimiter         Delimiter

hi def link qwikPluginName            htmlTag
hi def link qwikPluginValue           String
hi def link qwikPluginOperator        htmlTagName

hi def link qwikComment               Comment

let b:current_syntax = "qwik"

" vim:set sw=2:
