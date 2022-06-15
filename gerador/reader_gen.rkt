#lang racket

(require "parser_gen.rkt"
         "interp_gen.rkt"
         "syntax_gen.rkt")

(provide (rename-out [one-gen-read read]
                     [one-gen-read-syntax read-syntax]))

(define (one-gen-read in)
  (syntax->datum
   (one-gen-read-syntax #f in)))

(define (one-gen-read-syntax path port)
  (datum->syntax
   #f
   `(module one-mod racket
      ,(finish (one-gen-interp (path port))))))

(define (finish env)
  (displayln "Finished!"))
