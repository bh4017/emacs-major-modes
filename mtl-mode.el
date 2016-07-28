;; mtl-model.el
;; Mode for editing Aeroflex ICT mtl files

;; This code is based on a tutuorial by ErgoEmacs, here:
;; ergoemacs.org/emacs/elisp/elisp_syntax_coloring.html

;; Author:   Brian J Hoskins  brian@hoskins.eu
;; Version:  0.1
;; Created:  28 June 2016
;; Homepage: http://brianhoskins.uk

;; LICENSE:


(defvar mtl-syntax-table nil "Syntax table for mtl-mode")
(setq mtl-syntax-table
      (let((synTable(make-syntax-table)))

        (modify-syntax-entry ?\( ". 1" synTable)
        (modify-syntax-entry ?\) ". 4" synTable)
        (modify-syntax-entry ?* ". 23" synTable)

        synTable))

;; Define keyword categories
(setq mtl-keywords '("ACV" "CONTACT" "DISCHARGE" "FOR" "MODULE" "REPEAT" "TESTMACRO"
                     "TRANSF" "WITH" "BITS" "CONTINUE" "ELSE" "IF" "OPTO" "RES"
                     "TESTPINS" "TYPEOF" "ZENER" "BREAK" "DCI" "IND" "PATGEN"
                     "RETURN" "TESTMODULE" "UNTIL" "CAP" "DCV" "EXIT" "LED" "PIN"
                     "TRACK" "CASE" "DIODE" "FET" "LINK" "PULSE" "TESTBLOCK" "TRAN"
                     "WHILE"))

(setq mtl-types '("int" "float" "string" "value" "pinlist" "enum" "bits" "void"))
(setq mtl-functions '("printf" "sprintf" "fopen" "fread" "fwrite" "fprintf"
                      "fseek" "fgetc" "fgets" "fputc" "fputs" "getchar" "gets"
                      "putchar" "puts" "atoi" "atof" "atos" "atopin" "open"
                      "read" "write" "lseek" "close" "select" "findfile"
                      "vt.position" "vt.cursor" "vt.mode" "vt.attributes.type"
                      "vt.attributes" "vt.status" "vt.save" "vt.restore"
                      "vt.charset" "vt.pagemode" "vt.clearscreen" "vt.clearline"
                      "vt.passall" "vt.flush" "vt.panel" "vt.scroll"
                      "vt.message" "vt.optimise" "vt.wrap" "vt.fulledit"
                      "loadmap" "sizeof"))

;; Generate regex string for each keyword category
(setq mtl-keywords-regexp (regexp-opt mtl-keywords 'words))
(setq mtl-types-regexp (regexp-opt mtl-types 'words))
(setq mtl-functions-regexp (regexp-opt mtl-functions 'words))

;; Create the list for font-lock
(setq mtl-font-lock-keywords
      `(
        (,mtl-types-regexp . font-lock-type-face)
        (,mtl-functions-regexp . font-lock-builtin-face)
        (,mtl-keywords-regexp . font-lock-keyword-face)
        ))

(define-derived-mode mtl-mode prog-mode
  "mtl mode"
  "Major mode for editing Aeroflex ICT mtl files"

;; code for syntax highlighting
	(set-syntax-table mtl-syntax-table)
  (set (make-local-variable 'font-lock-defaults)
			 '(mtl-font-lock-keywords nil t)))

;; Setup tabs
(setq-default indent-tabs-mode t)
(setq tab-width 2)

;; Clear memory (no longer needed)
(setq mtl-keywords nil)
(setq mtl-types nil)
(setq mtl-types nil)
;;(setq mtl-expressions nil)
(setq mtl-functions nil)

(setq mtl-keywords-regexp nil)
(setq mtl-types-regexp nil)
;;(setq mtl-expressions-regexp nil)
(setq mtl-functions-regexp nil)


;; Add mode to features list
(provide 'mtl-mode)
