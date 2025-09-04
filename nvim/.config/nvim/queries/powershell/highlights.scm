; inherits: powershell

; extends

; Custom highlight for $env variables
((variable) @variable.environment
  (#lua-match? @variable.environment "^$env:"))
