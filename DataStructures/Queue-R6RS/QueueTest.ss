#lang r6rs

(import (rnrs)
        (Queue))

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
               (and (guard (con (#t (equal? con "empty queue")))
                           (and (queue-head q0) #f))
                    (equal? (queue-head q1) 1)
                    (equal? (queue-head q2) 1)
                    (equal? (queue-head q3) 2)
                    (equal? (queue-head q4) 2)
                    (equal? (queue-head q5) 3)
                    (guard (con (#t (equal? con "empty queue")))
                           (and (queue-head q6) #f))))
         (test "queue-tail"
               (and (guard (con (#t (equal? con "empty queue")))
                           (and (queue-tail q0) #f))
                    (queue-equal? (queue-tail q1) q0)
                    (queue-equal? (queue-tail q2) q3)
                    (queue-equal? (queue-tail q4) q5)
                    (queue-equal? (queue-tail q5) q0)
                    (guard (con (#t (equal? con "empty queue")))
                           (and (queue-tail q6) #f)))))))

(define main
  (display
   (cond (test-queue "All tests passed!")
         (#t "Test failed!"))))