" syntax/flint.vim
if exists("b:current_syntax")
  finish
endif

" Create a super-cluster which contains all matching groups
syntax cluster flintTop contains=flintComment,flintTodo,flintKeyword,flintStatement,flintControlFlow,flintRepetition,flintConditional,flintException,flintPreProc,flintStorageClass,flintPrimitive,flintConstant,flintNumber,tupleAccess,flintCharacter,flintString,flintEscape,flintIString,flintOperator,comparisonOperator,assignOperator,mathOperator,unaryOperator,logicOperator,otherOperator,flintDelimiter,flintFunction,flintType,flintOptionalType,flintIdentifier,flintConstantName

" Comments
syntax keyword flintTodo contained TODO FIXME XXX
syntax match flintDescriptor "@[A-Za-z]*"
syntax match flintComment "//.*$" contains=flintTodo,flintDescriptor
syntax region flintComment start="/\*" end="\*/" contains=flintTodo,flintDescriptor

" Keywords
syntax keyword flintKeyword
      \ def data func entity enum variant error test
syntax keyword flintThreading
      \ spawn sync lock
syntax keyword flintControlFlow
      \ return break continue
syntax keyword flintPreProc
      \ use as requires extends link
syntax keyword flintStorageClass
      \ const mut shared
syntax keyword flintRepetition
      \ for in while do
syntax keyword flintConditional
      \ if else switch
syntax keyword flintException
      \ throw catch
syntax keyword flintPrimitive
      \ str fn bp bool u8 i32 i64 u32 u64 f32 f64 bool8 anyerror
      \ i32x2 i32x3 i32x4 i32x8 i64x2 i64x3 i64x4
      \ f32x2 f32x3 f32x4 f32x8 f64x2 f64x3 f64x4
syntax keyword flintConstant
      \ true false none

" Numbers
syntax match flintNumber "\<\d\+\(\.\d\+\)\?\>"
syntax match tupleAccess "\$\d\+"

" Strings
syntax region flintIExpr matchgroup=flintDelimiter start="{" end="}"  contains=@flintTop
syntax match flintEscape "\\\(x..\|[^x]\)"
syntax region flintCharacter start="'" end="'" contains=flintEscape
syntax region flintString start='"' end='"' contains=flintEscape
syntax region flintIString start='\$"' end='"' contains=flintEscape,flintIExpr

" Operators
syntax match comparisonOperator "==\|!=\|<=\|<\|>\|>="
syntax match assignOperator "=\|:=\|+=\|-=\|*=\|/="
syntax match mathOperator "+\|-\|*\|%"
syntax match unaryOperator "--\|++\|!\|\."
syntax keyword logicOperator
      \ not and or
syntax match otherOperator "->\|::\||>\|?\.\|??\|!\."
syntax match flintDelimiter ";\|:\|_\|(\|)\|{\|}\|\[\|\]"

" Definitions
syntax match flintFunction "[a-z_][A-Za-z0-9_]*\ze("
syntax match flintType "[A-Z][A-Za-z0-9_]*"
syntax match flintOptionalType "?\ze[^.?]"
syntax match flintIdentifier "[^a-z]\zs[a-z_][A-Za-z0-9_]*\ze[^(A-Za-z0-9_]"
syntax match flintConstantName "[^a-zA-Z_]\zs[A-Z_][A-Z0-9_]*\ze[^(A-Za-z0-9_]"

" --- Link the flint-groups to the already existent highlighting groups ---
" Comments
hi def link flintTodo           Todo
hi def link flintDescriptor     Special
hi def link flintComment        Comment

" Keywords
hi def link flintKeyword        Keyword
hi def link flintThreading      Statement
hi def link flintControlFlow    Conditional
hi def link flintRepetition     Repeat
hi def link flintException      Exception
hi def link flintPreProc        PreProc
hi def link flintConditional    Conditional
hi def link flintStorageClass   StorageClass
hi def link flintPrimitive      Type
hi def link flintConstant       Constant

" Numbers
hi def link flintNumber         Number
hi def link tupleAccess         SpecialChar

" Strings
hi def link flintEscape         SpecialChar
hi def link flintCharacter      Character
hi def link flintString         String
hi def link flintIString        String

" Operators
hi def link comparisonOperator  Operator
hi def link assignOperator      Operator
hi def link mathOperator        Operator
hi def link unaryOperator       Operator
hi def link logicOperator       Operator
hi def link otherOperator       Operator
hi def link flintDelimiter      Delimiter

" Definitions
hi def link flintFunction       Function
hi def link flintType           Structure
hi def link flintOptionalType   Type
hi def link flintIExpr          Special
hi def link flintIdentifier     Identifier
hi def link flintConstantName   Constant

let b:current_syntax = "flint"
