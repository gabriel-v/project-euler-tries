(defun invers (n) 
  (let  ((inv 0))
    (loop while (> n 0)
          do (setq inv (+ (* inv 10) (mod n 10))
               n (floor (/ n 10)))
          finally (return inv))))

(defun palindrom (n) (= n (invers n)))

(loop 
  for a from 100 to 999
  for b from a to 999
  when (palindrom (* a b))
    do (format t "a:~a b:~a num=~a ~%" a b (* a b)))
