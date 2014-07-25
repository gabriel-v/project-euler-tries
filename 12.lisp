(defun diviz (n)
  (loop for i from 1 to n 
        count (zerop (mod n i))))
(defun good-p (n) (> (div n) 500))
(defun tri (n) (/ (* n (1+ n)) 2))

(defun sieve (n)
  (let ((B   (make-array (1+ n) 
                      :element-type 'bit
                      :initial-element 0)))
    (loop for i from 2 to n
          when (zerop (bit B i))
          collect i 
          and do (loop for j from (* i i) to n by i
                       do (setf (bit b j) 1)))))

(defvar *primes* (sieve (expt 10 8)))

(defun prime-decomp (n)
  (let ((ex 0))
    (loop for i in *primes* 
        do (setf ex 0)
        while (<= i n)
        when (zerop (mod n i))
            do (loop while (zerop (mod n i)) 
                     do (progn (setf n (/ n i)) (incf ex)))
            and collect (cons i ex))))

(defun div (n)
  (apply #'* 
         (mapcar #'1+ 
                 (mapcar #'cdr 
                         (prime-decomp n)))))



(defun do-it ()
  (format t "RASPUNS:~%~a~%" (loop for i from 1 
        do (format t "~a~%" i)
        while (not (good-p (tri i)))
        finally (return i))))
