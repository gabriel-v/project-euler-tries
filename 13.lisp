(defun read-file (file)
  (let ((nums nil))
    (with-open-file (s file)
      (setf nums
            (loop for line = (read-line s nil 'eof)
                  until (eq line 'eof)
                  collect line)))
    (return-from read-file nums)))


(defun do-sum (file)
  (subseq 
    (princ-to-string 
      (apply #'+ 
             (mapcar #'parse-integer 
                     (read-file file))))
    0
    10))

