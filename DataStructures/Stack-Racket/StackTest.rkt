#lang racket

(require rackunit rackunit/text-ui "Stack.rkt")

(define stack-tests
  (let* ((s0 empty-stack)
         (s1 (stack-cons 1 s0))
         (s2 (stack-cons 2 s1))
         (s3 (stack-cons 3 s2)))
    (test-suite
     "Tests for Stack.rkt"

     (test-case
      "stack-empty?"
      (check-true (stack-empty? s0))
      (for-each (lambda (s) (check-false (stack-empty? s)))
                (list s1 s2 s3)))

     (test-case
      "stack-head"
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty stack"))
                        (lambda (v) #t)])
                    (stack-head s0)
                    #f))
      (check-equal? (stack-head s1) 1)
      (check-equal? (stack-head s2) 2)
      (check-equal? (stack-head s3) 3))

     (test-case
      "stack-tail"
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty stack"))
                        (lambda (v) #t)])
                    (stack-tail s0)
                    #f))
      (check-equal? (stack-tail s1) s0)
      (check-equal? (stack-tail s2) s1)
      (check-equal? (stack-tail s3) s2)))))

(define main (run-tests stack-tests))
