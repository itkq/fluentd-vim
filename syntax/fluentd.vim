" Vim syntax file
" Language: Fluentd
" Maintainer: Takuya Kosugigyama
" Latest Revision: December 2016

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match FluentdComment +#.*+

syn keyword FluentdDirectiveKeyword source filter match label contained nextgroup=FluentdDirectiveCondition skipwhite
syn match FluentdDirectiveCondition +[^>]*+ contained

syn region FluentPluginBegin matchgroup=fluentdDelimiterBegin start=+<+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveCondition
syn region FluentPluginEnd matchgroup=fluentdDelimiterEnd start=+</+ end=+>$+ contains=FluentdDirectiveKeyword

hi link FluentdDirectiveKeyword   Keyword
hi link FluentdDelimiterBegin     Function
hi link FluentdDelimiterEnd       Command
hi link FluentdDirectiveCondition Type
hi link FluentdComment            Comment
