#lang racket

(require "parser.rkt"
         "interp.rkt"
         "syntax.rkt")

(provide (rename-out [one-v1-read read]
                     [one-v1-read-syntax read-syntax]))

(define (one-v1-read in)
  (syntax->datum
   (one-v1-read-syntax #f in)))

(define (one-v1-read-syntax path port)
  (datum->syntax
   #f
   `(module one-mod racket
      ,(finish (one-v1-interp (parse port))))))

(define (finish env)
  (displayln "Finished!"))