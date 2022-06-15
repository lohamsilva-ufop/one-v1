#lang racket

(require parser-tools/yacc
         "lexer_gen.rkt"
         "syntax_gen.rkt")

(define (texto string)
  string)

(define one-gen-parser
  (parser
   (start statements)
   (end EOF)
   (tokens value-tokens var-tokens syntax-tokens gen-tokens)
   (src-pos)
   (error
    (lambda (a b c d e)
      (begin
        (printf "a = ~a\nb = ~a\nc = ~a\nd = ~a\ne = ~a\n"
                a b c d e) (void))))
   
   (grammar
    (statements [() '()]
                [(statement statements) (cons $1 $2)])
    (statement [(TESTCASES COMMA expr) (testcases $3)]
               [(INT COMMA IDENTIFIER) (input (type "int") (var $3))])      
    (expr  [(NUMBER) (value $1)])
    )
   ))

(define (parse_gen ip)
  (begin
  (displayln "String recebida do parser da linguagem para o parser do gerador: ")
  (displayln (one-gen-parser (lambda () (next-token ip)))))
  (displayln "")
 )


(provide parse_gen)