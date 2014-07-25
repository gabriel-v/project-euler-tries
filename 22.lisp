(defun split (delim-p seq)
  (let ((parts nil)
        (new nil))
    (loop for i to (length seq)
          if (funcall delim-p i)
          do (if  (not (null new)) 
                  (push new parts))
          else do (push i new))
    parts))

(defun split2 (seq delim-p)
  (loop 
    for start = (position-if-not delim-p seq)
    then (position-if-not delim-p seq :start (1+ end))
    for end = (and start (position-if delim-p seq :start start))
    when start collect (subseq seq start end)
    while end))

(defun read-names (file)
  (let ((names nil))
    (with-open-file (s file)
      (setf names (read-line s nil 'eof nil)))
    names))

(defun spl (x)
  (or (equal x #\")
      (equal x #\space)
      (equal x #\,)))

(defun scor (x)
  (loop for i across x
        sum (1+ (- (char-int i) (char-int #\A)))))

(defun list-names (file)
  (sort 
    (split2 
      (read-names file)
      #'spl)
    #'string<))

(let ((n (list-names "22_names.txt")))
  (format t "RASPUNS: ~a~%"
          (loop for i from 1 to (length n)
            for x = (nth  (1- i) n)
            do (format t 
                       "~a: ~a ~a ~a ~%"
                       x
                     (scor x)
                     i
                      (* (scor x) i))
            sum (* (scor x) i))))


