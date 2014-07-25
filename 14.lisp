(defun iter (x)
  (if (oddp x)
      (1+ (* 3 x))
      (/ x 2)))

(defconstant NMAX (expt 10 6))

(defvar *dist* 
        (make-array NMAX
                    :element-type 'number 
                    :initial-element 0))
(setf (elt *dist* 1) 1)

(defun simple-dist (x)
  (loop for i from 1 
        for k = x then (iter k)
        do (format t "~a:~a~%" i k)
        when (= k 1)
        do (return i)))

(defun find-ind (n)
  (if (< n NMAX)
    (if (zerop (elt *dist* n))
      (setf (elt *dist* n)
            (1+ (find-ind (iter n))))
      (elt *dist* n))
    ; n >= NMAX => iteram pana gasim unul mai mic si/sau atins deja
    (1+ (find-ind (iter n)))))

(loop
  for i from 1 to 1000000
  do (format t "len(~a) = ~a ~%"
             i 
             (find-ind i)))

(format t "SOLUTIE : ~a"
        (reduce #'max *dist*))




