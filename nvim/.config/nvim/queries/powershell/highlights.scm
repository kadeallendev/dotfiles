;; inherits: powershell
;; extends

; Custom highlight for $env
((variable) @variable.environment
            (#lua-match? @variable.environment "^\$env:"))
