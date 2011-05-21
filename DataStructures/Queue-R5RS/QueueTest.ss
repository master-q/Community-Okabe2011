#lang r5rs

; insert definitions here

; test

(define (test title p)
  (cond (p p)
        (#t (display "Failed: ") (display title) (newline) #f)))

(define test-queue
  (let* ((q0 empty-queue)
         (q1 (queue-snoc 1 q0))
         (q2 (queue-snoc 2 q1))
         (q3 (queue-tail q2))
         (q4 (queue-snoc 3 q3))
         (q5 (queue-tail q4))
         (q6 (queue-tail q5)))
    (and (test "queue-empty?"
               (and (queue-empty? q0)
                    (not (or (queue-empty? q1)
                             (queue-empty? q2)
                             (queue-empty? q3)
                             (queue-empty? q4)
                             (queue-empty? q5)))
                    (queue-empty? q6)))
         (test "queue-head"
               (and (equal? (queue-head q0) 'error-empty-queue)
                    (equal? (queue-head q1) 1)
                    (equal? (queue-head q2) 1)
                    (equal? (queue-head q3) 2)
                    (equal? (queue-head q4) 2)
                    (equal? (queue-head q5) 3)
                    (equal? (queue-head q6) 'error-empty-queue)))
         (test "queue-tail"
               (and (equal? (queue-tail q0) 'error-empty-queue)
                    (equal? (queue-tail q1) q0)
                    (equal? (queue-tail q2) q3)
                    (equal? (queue-tail q4) q5)
                    (equal? (queue-tail q5) q0)
                    (equal? (queue-tail q6) 'error-empty-queue))))))

(define main
  (display
   (cond (test-queue "All tests passed!")
         (#t "Test failed!"))))
