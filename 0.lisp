(defparameter *bitset* nil)

(defun prime-sieve (n)
  "lista de numere prime de la 2 la n inclusiv"
  (let ((bitset (make-array (1+ n) 
                            :element-type 'bit
                            :initial-element 0))
        (primes (loop for c from 2 to n
                      when (zerop (bit bitset c))
                      collect c 
                      and do (loop for x from (expt c 2) to n by c
                                   do (setf (bit bitset x) 1)))))
    ;(setf *bitset* bitset)
    primes))

(defun prime-p (n)
  (zerop (bit *bitset* n)))

(defun prime-decomp (n prime-list)
  "descompunere de numere prime sub forma ((p1 . e1) (p2 . e2 ) ... )"
  (let ((ex 0))
    (loop for i in prime-list 
          do (setf ex 0)
          while (<= i n)
          when (zerop (mod n i))
          do (loop while (zerop (mod n i)) 
                   do (progn (setf n (/ n i)) (incf ex)))
          and collect (cons i ex))))

(defun num-divisors (n prime-list)
  "numarul de divizori al lui n"
  (apply #'* 
         (mapcar #'1+ 
                 (mapcar #'cdr 
                         (prime-decomp n prime-list)))))


(defun sum-divisors (n prime-list)
  "suma divizorilor proprii ai lui n"
  (-
    (reduce #'* 
            (map 'list 
                 #'(lambda ( q )
                     (let ((p (car q))
                           (e (cdr q)))
                       (/ (- (expt p (1+ e)) 1)
                          (- p 1))))
                 (prime-decomp n prime-list)))
    n))


(format t "math shit loaded~%")
