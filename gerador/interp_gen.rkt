#lang racket

(require "syntax_gen.rkt")

(define (lookup-env env v)
  (let* ([val (hash-ref env v #f)])
    (if val
        (cons env val)
        (cons (hash-set env v (value 0))
              (value 0)))))


(define (eval-expr env e)
  (match e
    [(value val) (cons env (value val))]
    [(var v) (lookup-env env (var-id v))]))


(define (eval-stmt env s)
   display s;
 )
  
   
(define (eval-stmts env blk)
  (match blk
    ['() env]
    [(cons s blks) (let ([nenv (eval-stmt env s)])
                       (eval-stmts nenv blks))]))

(define (one-gen-interp prog)
  (eval-stmts (make-immutable-hash) prog))

(provide one-gen-interp eval-expr)
