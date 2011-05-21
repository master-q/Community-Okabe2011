#lang r5rs

; insert definitions here

; test

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
               (and (equal? (stack-head s0) 'error-empty-stack)
                    (equal? (stack-head s1) 1)
                    (equal? (stack-head s2) 2)
                    (equal? (stack-head s3) 3)))
         (test "stack-tail"
               (and (equal? (stack-tail s0) 'error-empty-stack)
                    (equal? (stack-tail s1) s0)
                    (equal? (stack-tail s2) s1)
                    (equal? (stack-tail s3) s2))))))

(define main
  (display
   (cond (test-stack "All tests passed!")
         (#t "Test failed!"))))
