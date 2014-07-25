;(defun read-num (file)
;    (let ((stream (open file)))
;    (format t (apply #'concatenate 'string 
;           (loop 
;                for line = (read-line stream nil 'eof)
;                until (eq line 'eof)
;                collect line)))
;    (close stream)))
;

(defvar nums nil)

(defun val (char) 
  (- (char-int char) (char-int #\0)))


(defun read2 (file)
  (with-open-file (s file)
    (setf nums (apply #'concatenate 'list 
                     (loop 
                       for line = (read-line s nil 'eof)
                       until (eq line 'eof)
                       collect line)))))

(defun seq-product (lst n)
  (apply #'* (subseq lst 0 n)))

(read2 "8_number.txt")
(setf nums (mapcar #'val nums))

(format t "~a~%"(loop for seq on nums
      while (>= (length seq) 13)
      maximize (seq-product seq 13)))
