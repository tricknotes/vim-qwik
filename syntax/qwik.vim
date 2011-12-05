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

syn cluster qwikBlock contains=qwikH1,qwikH2,qwikH3,qwikH4,qwikH5,qwikH6,qwikBlockquote,qwikListMarker,qwikOrderedListMarker
syn cluster qwikInline contains=qwikBold

syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^![^!]"       end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^!![^!]"      end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^!!![^!]"     end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^!!!![^!]"    end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^!!!!![^!]"   end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^!!!!!![^!]"  end="!*\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH1 matchgroup=qwikHeadingDelimiter start="^\*[^*]"            end="\**\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH2 matchgroup=qwikHeadingDelimiter start="^\*\*[^*]"          end="\**\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH3 matchgroup=qwikHeadingDelimiter start="^\*\*\*[^*]"        end="\**\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH4 matchgroup=qwikHeadingDelimiter start="^\*\*\*\*[^*]"      end="\**\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH5 matchgroup=qwikHeadingDelimiter start="^\*\*\*\*\*[^*]"    end="\**\s*$" keepend oneline contains=@qwikInline contained
syn region qwikH6 matchgroup=qwikHeadingDelimiter start="^\*\*\*\*\*\*[^*]"  end="\**\s*$" keepend oneline contains=@qwikInline contained

syn match qwikBlockquote ">\s" contained nextgroup=@qwikBlock

syn match qwikListMarker "-\{0,4\}\%(\s\+\S\)\@=" contained
syn match qwikOrderedListMarker "+\{0,4\}\%(\s\+\S\)\@=" contained

syn region qwikBold matchgroup=qwikCodeDelimiter start="''" end="''" keepend oneline contains=qwikLineStart
syn region qwikBold matchgroup=qwikCodeDelimiter start="'''" end="'''" keepend oneline contains=qwikLineStart

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

hi def link qwikBold                  htmlBold

let b:current_syntax = "qwik"

" vim:set sw=2:
