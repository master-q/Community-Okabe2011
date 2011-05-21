#lang racket

(require rackunit rackunit/text-ui "Queue.rkt")

(define queue-tests
  (let* ((q0 empty-queue)
         (q1 (queue-snoc 1 q0))
         (q2 (queue-snoc 2 q1))
         (q3 (queue-tail q2))
         (q4 (queue-snoc 3 q3))
         (q5 (queue-tail q4))
         (q6 (queue-tail q5)))
    (test-suite
     "Tests for Queue.rkt"

     (test-case
      "queue-empty?"
      (for-each (lambda (q) (check-true (queue-empty? q)))
                (list q0 q6))
      (for-each (lambda (q) (check-false (queue-empty? q)))
                (list q1 q2 q3 q4 q5)))

     (test-case
      "queue-head"
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty queue"))
                        (lambda (v) #t)])
                    (queue-head q0)
                    #f))
      (check-equal? (queue-head q1) 1)
      (check-equal? (queue-head q2) 1)
      (check-equal? (queue-head q3) 2)
      (check-equal? (queue-head q4) 2)
      (check-equal? (queue-head q5) 3)
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty queue"))
                        (lambda (v) #t)])
                    (queue-head q6)
                    #f)))

     (test-case
      "queue-tail"
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty queue"))
                        (lambda (v) #t)])
                    (queue-tail q0)
                    #f))
      (check-equal? (queue-tail q1) q0)
      (check-equal? (queue-tail q2) q3)
      (check-equal? (queue-tail q4) q5)
      (check-equal? (queue-tail q5) q0)
      (check-true (with-handlers
                      ([(lambda (v) (equal? v "empty queue"))
                        (lambda (v) #t)])
                    (queue-tail q6)
                    #f))))))

(define main (run-tests queue-tests))