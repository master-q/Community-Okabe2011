(defpackage :stacktest
  (:use :common-lisp :stack))

(defun test (title p)
  (cond (p p)
        (t (format t "Failed: ~a~%" title) nil)))

(defun test-stack ()
  (let* ((s0 empty-stack)
         (s1 (stack-cons 1 s0))
         (s2 (stack-cons 2 s1))
         (s3 (stack-cons 3 s2)))
    (and (test "stack-is-empty"
               (and (stack-is-empty s0)
                    (not (or (stack-is-empty s1)
                             (stack-is-empty s2)
                             (stack-is-empty s3)))))
         (test "stack-head"
               (and (handler-case
                      (progn (stack-head s0) nil)
                      (empty-stack-error () t))
                    (equal (stack-head s1) 1)
                    (equal (stack-head s2) 2)
                    (equal (stack-head s3) 3)))
         (test "stack-tail"
               (and (handler-case
                      (progn (stack-tail s0) nil)
                      (empty-stack-error () t))
                    (equal (stack-tail s1) s0)
                    (equal (stack-tail s2) s1)
                    (equal (stack-tail s3) s2))))))

(defun main ()
  (cond ((test-stack) (format t "All tests passed!~%"))
        (t (format t "Test failed!~%"))))
