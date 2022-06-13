#lang racket


(module reader racket
  (require "../parser.rkt")
  (provide (rename-out [imp-read-extendido read]
                       [imp-read-syntax-extendido read-syntax]))


  (define (imp-read-extendido in)
    (syntax->datum
     (imp-read-syntax-extendido #f in)))

  (define (imp-read-syntax-extendido path port)
    (datum->syntax
     #f
     `(module imp-mod-extendido racket
        ,@(parse port)))))
