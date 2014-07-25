
;; solutia este C(n, k) unde n = a+b si k = b, adica C(40, 20)

(defun int-seq (a b)
  (loop for i from a to b collect i))

(defun fact (n)
  (reduce #'* (int-seq 1 n)))

(defun comb (n k)
  (/ (fact n)
     (* (fact k)
        (fact (- n k)))))





