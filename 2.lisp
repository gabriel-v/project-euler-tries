(defvar *phi* (/ (+ 1 (sqrt 5))2))
(defvar *psi* (- 1 *phi*))
(defun fib (n) 
   (round (/ (- (expt *phi* n) (expt *psi* n))
            (sqrt 5))))
(defvar fib2 (n)
  (loop for f1 = 0 then f2
        and f2 = 1 then (+ f1 f2)
        repeat n
        finally (return f1)))

(loop for i = 3 then (+ i 3)
      for j = (fib i)
      while (< j 4000000)
      sum j
      do (format t "~a ~%" j))

