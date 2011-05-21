#lang r6rs

(import (rnrs)
        (Stack))

(define (test title p)
  (cond (p p)
        (#t (display "Failed: ") (display title) (newline) #f)))

(define test-stack
  (let* ((s0 empty-stack)
         (s1 (stack-cons 1 s0))
         (s2 (stack-cons 2 s1))
         (s3 (stack-cons 3 s2)))
    (and (test "stack-empty?"
               (and (stack-empty? s0)
                    (not (or (stack-empty? s1)
                             (stack-empty? s2)
                             (stack-empty? s3)))))
         (test "stack-head"
               (and (guard (con (#t (equal? con "empty stack")))
                           (and (stack-head s0) #f))
                    (equal? (stack-head s1) 1)
                    (equal? (stack-head s2) 2)
                    (equal? (stack-head s3) 3)))
         (test "stack-tail"
               (and (guard (con (#t (equal? con "empty stack")))
                           (and (stack-tail s0) #f))
                    (stack-equal? (stack-tail s1) s0)
                    (stack-equal? (stack-tail s2) s1)
                    (stack-equal? (stack-tail s3) s2))))))

(define main
  (display
   (cond (test-stack "All tests passed!")
         (#t "Test failed!"))))