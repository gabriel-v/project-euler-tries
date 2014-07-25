(defun dif (X) 
  (- (expt (apply #'+ X) 2)
     (apply #'+ (mapcar #'(lambda (x) (* x x))
                        X))))

(dif (loop for i from 1 to 100 collect i))

