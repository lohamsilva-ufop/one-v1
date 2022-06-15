#lang racket

;; expression syntax

(struct testcases
  (tamanho)
  #:transparent)

(struct input
  (tipo variavel)
  #:transparent)

(struct value
  (value)
  #:transparent)

(struct var
  (id)
  #:transparent)

(struct type
  (id)
  #:transparent)

(provide (all-defined-out))


