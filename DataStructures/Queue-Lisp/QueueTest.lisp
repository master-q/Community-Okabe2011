(defpackage :queuetest
  (:use :common-lisp :queue))

(defun test (title p)
  (cond (p p)
        (t (format t "Failed: ~a~%" title) nil)))

(defun test-queue ()
  (let* ((q0 empty-queue)
         (q1 (queue-snoc 1 q0))
         (q2 (queue-snoc 2 q1))
         (q3 (queue-tail q2))
         (q4 (queue-snoc 3 q3))
         (q5 (queue-tail q4))
         (q6 (queue-tail q5)))
    (and (test "queue-is-empty"
               (and (queue-is-empty q0)
                    (not (or (queue-is-empty q1)
                             (queue-is-empty q2)
                             (queue-is-empty q3)
                             (queue-is-empty q4)
                             (queue-is-empty q5)))
                    (queue-is-empty q6)))
         (test "queue-head"
               (and (handler-case
                      (progn (queue-head q0) nil)
                      (empty-queue-error () t))
                    (equal (queue-head q1) 1)
                    (equal (queue-head q2) 1)
                    (equal (queue-head q3) 2)
                    (equal (queue-head q4) 2)
                    (equal (queue-head q5) 3)
                    (handler-case
                      (progn (queue-head q6) nil)
                      (empty-queue-error () t))))
         (test "queue-tail"
               (and (handler-case
                      (progn (queue-tail q0) nil)
                      (empty-queue-error () t))
                    (equal (queue-tail q1) q0)
                    (equal (queue-tail q2) q3)
                    (equal (queue-tail q4) q5)
                    (equal (queue-tail q5) q0)
                    (handler-case
                      (progn (queue-tail q6) nil)
                      (empty-queue-error () t)))))))

(defun main ()
  (cond ((test-queue) (format t "All tests passed!~%"))
        (t (format t "Test failed!~%"))))
