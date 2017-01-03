" Vim syntax file
" Language: Fluentd
" Maintainer: Takuya Kosugigyama
" Latest Revision: December 2016

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword FluentdDirectiveKeyword source filter match label store buffer contained nextgroup=FluentdDirectiveCondition skipwhite

syn match FluentdDirectiveBegin +[^<>]\++ contained
syn match FluentdDirectiveEnd +[^<>]\++ contained

syn match FluentdComment +#.*+
syn match FluentdString +"[^"]*"+

syn match FluentdDirectiveLabel +@[^>]*+ contained
syn region FluentdPluginBegin matchgroup=fluentdDelimiterBegin start=+<+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveLabel,FluentdDirectiveBegin
syn region FluentdPluginEnd matchgroup=fluentdDelimiterEnd start=+</+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveEnd

syn match FluentdTag +^\s\+@\S*+
syn match FluentdUserTag +@[^>]*+

syn match FluentdSymbol +\s\d\++
syn match FluentdIp +\s\+\d\{1,3}\(\.\d\{1,3}\)\{3}\(:\d\{1,5}\|/\d\{1,2}\)\?+

syn match FluentdEnvironment +\${.*}+

hi link FluentdDirectiveKeyword   Label
hi link FluentdDelimiterBegin     Function
hi link FluentdDelimiterEnd       Identifier
hi link FluentdDirectiveLabel     Function
hi link FluentdComment            Comment
hi link FluentdTag                Identifier
hi link FluentdUserTag            Function
hi link FluentdString             String
hi link FluentdSymbol             Number
hi link FluentdIp                 Number
hi link FluentdDirectiveBegin     Function
hi link FluentdDirectiveEnd       Identifier
hi link FluentdEnvironment        Macro
