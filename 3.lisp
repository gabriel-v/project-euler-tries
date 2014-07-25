(defun rupe (n i)
  (if (zerop (mod n i))
      (rupe (/ n i) i)
      n))

(defun factor (n)
  (loop for i = 2 then (1+ i)
        and k = n then (rupe k i)
        when (zerop (mod k i)) collect i
        while (> k i)))

(factor 15)

