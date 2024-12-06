;; This is modified from queries/rust/textobjects.scm

; functions
(function) @function.outer

(function
	"{"
	.
	(_) @_start @_end
	(_)? @_end
	.
	"}"
	(#make-range! "function.inner" @_start @_end))

(anonymous_function) @function.outer

(anonymous_function
	"{"
	.
	(_) @_start @_end
	(_)? @_end
	.
	"}"
	(#make-range! "function.inner" @_start @_end))

; quantifies as class(es)
(type_definition) @class.outer
(data_constructors) @class.inner

; conditionals
(case) @conditional.outer
(case_clause) @conditional.inner

; blocks
(block) @block.outer
(block
	"{"
	.
	(_) @_start @_end
	(_)? @_end
	.
	"}"
	(#make-range! "block.inner" @_start @_end))

; calls
(function_call) @call.outer

(function_call
  arguments: (arguments
    .
    "("
    .
    (_) @_start
    (_)? @_end
    .
    ")"
    (#make-range! "call.inner" @_start @_end)))

; comments
[
 (module_comment)
 (statement_comment)
 (comment)
] @comment.outer

; parameter
(( ","? @_start
	 . 
	 [
		(function_parameter)
		(argument)
		(type_argument)
		(data_constructor_argument)
	] @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner))

((tuple
	 ","? @_start
	 . 
	 (identifier) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner))

((tuple_pattern
	 ","? @_start
	 . 
	 (identifier) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner))

((record_pattern_arguments
	 ","? @_start
	 . 
	 (record_pattern_argument) @parameter.inner)
 (#make-range! "parameter.outer" @_start @parameter.inner))

; (struct_item
;   body: (field_declaration_list
;     "," @_start
;     .
;     (_) @parameter.inner
;     (#make-range! "parameter.outer" @_start @parameter.inner)))
;
; (struct_item
;   body: (field_declaration_list
;     .
;     (_) @parameter.inner
;     .
;     ","? @_end
;     (#make-range! "parameter.outer" @parameter.inner @_end)))
;
; (struct_expression
;   body: (field_initializer_list
;     "," @_start
;     .
;     (_) @parameter.inner
;     (#make-range! "parameter.outer" @_start @parameter.inner)))
;
; (struct_expression
;   body: (field_initializer_list
;     .
;     (_) @parameter.inner
;     .
;     ","? @_end
;     (#make-range! "parameter.outer" @parameter.inner @_end)))

[
  (integer)
  (float)
] @number.inner

(let
  pattern: (_) @assignment.inner @assignment.lhs
  value: (_) @assignment.inner @assignment.rhs) @assignment.outer

