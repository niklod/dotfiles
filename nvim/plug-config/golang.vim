let g:go_null_module_warning = 0

" disable vim-go :GoDef short cut (gd)
let g:go_def_mapping_enabled = 0

" Linter config
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

let g:go_doc_popup_window = 1

" autoimports on save
let g:go_fmt_command = "goimports"

" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_diagnostic_errors = 1
