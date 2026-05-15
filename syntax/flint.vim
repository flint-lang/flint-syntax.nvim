" syntax/flint.vim
if exists("b:current_syntax")
  finish
endif

" Create a super-cluster which contains all matching groups
syntax cluster flintTop contains=flintComment,flintAnnotation,flintTodo,flintKeyword,flintStatement,flintControlFlow,flintRepetition,flintConditional,flintException,flintPreProc,flintStorageClass,flintPrimitive,flintConstant,flintNumber,flintCharacter,flintString,flintEscape,flintIString,flintDelimiter,flintOperator,comparisonOperator,assignOperator,mathOperator,unaryOperator,logicOperator,otherOperator,flintFunctionRefOp,variantExtractOperator,tupleAccess,flintFunction,flintFunctionReference,flintConstantName,flintType,flintOptionalType,flintIdentifier

" Comments
syntax keyword flintTodo contained TODO FIXME NOTE WARNING
syntax match flintDescriptor "@[A-Za-z]*"
syntax match flintComment "//.*$" contains=flintTodo,flintDescriptor
syntax region flintComment start="/\*" end="\*/" contains=flintTodo,flintDescriptor

" Annotations
syntax match flintAnnotation "#.*$"

" Keywords
syntax keyword flintKeyword
      \ def data func entity enum variant error test extern export
syntax keyword flintThreading
      \ spawn sync lock
syntax keyword flintControlFlow
      \ return break continue
syntax keyword flintPreProc
      \ use as type requires extends link hook
syntax keyword flintStorageClass
      \ const mut shared persistent
syntax keyword flintRepetition
      \ for in while do
syntax keyword flintConditional
      \ if else switch
syntax keyword flintException
      \ throw catch
syntax keyword flintPrimitive
      \ str fn bp void bool bool8 anyerror opaque
      \ u8 i8 u16 i16 u32 i32 u64 i64 int f32 f64 float
      \ u8x2 u8x3 u8x4 u8x8
      \ i32x2 i32x3 i32x4 i32x8 i64x2 i64x3 i64x4
      \ f32x2 f32x3 f32x4 f32x8 f64x2 f64x3 f64x4
syntax keyword flintConstant
      \ true false none null

" Numbers
syntax match flintNumber "\<\d\+\(_\d\+\)*\(\.\d\+\(_\d\+\)*\)\?\>"

" Strings
syntax region flintIExpr matchgroup=flintDelimiter start="{" end="}"  contains=@flintTop
syntax match flintEscape "\\\(x..\|[^x]\)"
syntax region flintCharacter start="'" end="'" contains=flintEscape
syntax region flintString start='"' end='"' contains=flintEscape
syntax region flintIString start='\$"' end='"' contains=flintEscape,flintIExpr

" Delimiter
syntax match flintDelimiter ";\|[^:]\zs:\ze[^:]\|(\|)\|{\|}\|\[\|\]"

" Operators
syntax match comparisonOperator "==\|!=\|<=\|<\|>\|>="
syntax match assignOperator ":=\|=\|+=\|-=\|*=\|/="
syntax match mathOperator "+\|-\|*\|%"
syntax match unaryOperator "--\|++\|!\|\.\|&"
syntax keyword logicOperator
      \ not and or
syntax match divisionOperator "/\ze[^/*]"
syntax match otherOperator "->\||>\|?\.\|??\|!\.\|_"
syntax match variantExtractOperator "?\ze[([]"
syntax match tupleAccess "\$\d\+"

" Definitions
syntax match flintType "\<[A-Z][A-Za-z0-9_]*\>"
syntax match flintConstantName "\<\([A-Z][A-Z0-9_]*\|[A-Z_][A-Z0-9_]\+\)\>"
syntax match flintIdentifier "\(::\)\@<!\zs\<\([a-z][A-Za-z0-9_]*\|[a-z_][A-Za-z0-9_]\+\)\>"
syntax match flintFunction "\<[a-z_][A-Za-z0-9_]*\>\ze("
"syntax match flintFunctionReference "::\zs\<[a-z_][A-Za-z0-9_]*\>"
syntax match flintFunctionReference "::[a-z_][A-Za-z0-9_]*" contains=flintFunctionRefOp
syntax match flintFunctionRefOp "::" contained
syntax match flintOptionalType "?\ze[^.?([]"

" --- Link the flint-groups to the already existent highlighting groups ---
" Comments
hi def link flintTodo       Todo
hi def link flintDescriptor Special
hi def link flintComment    Comment

" Annotations
hi def link flintAnnotation Comment

" Keywords
hi def link flintKeyword      Keyword
hi def link flintThreading    Statement
hi def link flintControlFlow  Conditional
hi def link flintRepetition   Repeat
hi def link flintException    Exception
hi def link flintPreProc      PreProc
hi def link flintConditional  Conditional
hi def link flintStorageClass StorageClass
hi def link flintPrimitive    Type
hi def link flintConstant     Constant

" Strings
hi def link flintEscape     SpecialChar
hi def link flintCharacter  Character
hi def link flintString     String
hi def link flintIString    String

" Operators
hi def link comparisonOperator      Operator
hi def link assignOperator          Operator
hi def link mathOperator            Operator
hi def link unaryOperator           Operator
hi def link logicOperator           Operator
hi def link divisionOperator        Operator
hi def link otherOperator           Operator
hi def link flintFunctionRefOp      Operator
hi def link flintDelimiter          Delimiter
hi def link variantExtractOperator  Operator

" Definitions
hi def link flintFunction           Function
hi def link flintFunctionReference  Function
hi def link flintType               Structure
hi def link flintOptionalType       Type
hi def link flintIExpr              Special
hi def link flintIdentifier         Identifier
hi def link flintConstantName       Constant

" Numbers
hi def link flintNumber Number
hi def link tupleAccess SpecialChar

let b:current_syntax = "flint"
