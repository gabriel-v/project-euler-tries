(load "0.lisp")

(defvar  *p* (prime-sieve 1234567))

(defun num-digits (n)
  (1+ (truncate (log n 10))))

(defun next (n)
  (+ (floor n 10)
     (* (rem n 10)
        (expt 10 (1- (num-digits n)))))) 

(defun rot (n)
  (loop 
    repeat (num-digits n)
    for i = n then (next i)
    collect i))

(defun ok (n)
  (every #'prime-p (rot n)))

(defun get-circular-primes (n)
  (loop
    for i in *p*
    while (<= i n)
    when (ok i) collect i))

(defun num-circular (n)
  (length (get-circular-primes n)))

