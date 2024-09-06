;; This is modified from queries/rust/textobjects.scm

; functions
(function
	body: (function_body) @function.inner) @function.outer

; quantifies as class(es)
(type_definition) @class.outer
(data_constructors) @class.inner

; conditionals
(case) @conditional.outer
(case_clause) @conditional.inner

; blocks
(block) @block.outer
; TODO add @block.inner

; (unsafe_block
;   (_)? @block.inner) @block.outer

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
(statement_comment) @comment.outer

; parameter
[
 (function_parameters)
 (arguments)
 (data_constructor_arguments)
] @parameter.outer

[
 (function_parameter)
 (argument)
 (data_constructor_argument)
] @parameter.inner


; ((type_parameters
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((type_parameters
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((tuple_pattern
;   "," @_start
;   .
;   (identifier) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((tuple_pattern
;   .
;   (identifier) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((tuple_struct_pattern
;   "," @_start
;   .
;   (identifier) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((tuple_struct_pattern
;   .
;   (identifier) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; (tuple_expression
;   "," @_start
;   .
;   (_) @parameter.inner
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; (tuple_expression
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((tuple_type
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((tuple_type
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
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
;
; ((closure_parameters
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((closure_parameters
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((arguments
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((arguments
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((type_arguments
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((type_arguments
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; ((token_tree
;   "," @_start
;   .
;   (_) @parameter.inner)
;   (#make-range! "parameter.outer" @_start @parameter.inner))
;
; ((token_tree
;   .
;   (_) @parameter.inner
;   .
;   ","? @_end)
;   (#make-range! "parameter.outer" @parameter.inner @_end))
;
; (scoped_use_list
;   list: (use_list
;     "," @_start
;     .
;     (_) @parameter.inner
;     (#make-range! "parameter.outer" @_start @parameter.inner)))
;
; (scoped_use_list
;   list: (use_list
;     .
;     (_) @parameter.inner
;     .
;     ","? @_end
;     (#make-range! "parameter.outer" @parameter.inner @_end)))
;
; [
;   (integer_literal)
;   (float_literal)
; ] @number.inner

(let
  pattern: (_) @assignment.inner @assignment.lhs
  value: (_) @assignment.inner @assignment.rhs) @assignment.outer

