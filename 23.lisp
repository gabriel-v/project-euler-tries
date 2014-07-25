(load "0.lisp")
(defconstant NMAX 32000)
(defvar *p* (prime-sieve NMAX))

(defun abundant-p (n)
  (> (sum-divisors n *p*)
     n))
(defvar *a* 
  (loop for i from 1 to NMAX
        when (abundant-p i)
        collect i))
(defvar *x*
  (loop for i on *a*
        for b in i
        with a = (car i)
        collect (+ a b)))
(defun int-seq (a b)
  (loop for i from a to b collect i))

(defun results ()
  (remove-if #'(lambda (x) (find x *x*)) (int-seq 1 NMAX)))



