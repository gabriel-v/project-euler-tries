(defun prime (n)
  (let ((bitset (make-array (1+ n) 
                            :element-type 'bit
                            :initial-element 0)))
    (loop for c from 2 to n
          when (zerop (bit bitset c))
            collect c 
            and do (loop for x from (expt c 2) to n by c
                         do (setf (bit bitset x) 1)))))

(nth 10000 (prime 100000))

