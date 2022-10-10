(defstruct course code name prereqs)

(defvar a (make-array 3 :initial-element nil))

(defun quicksort (vec comp)
  (when (> (length vec) 1)
    (let ((pivot-i 0)
          (pivot (aref vec (1- (length vec)))))
      (dotimes (i (1- (length vec)))
        (when (funcall comp (aref vec i) pivot)
          (rotatef (aref vec i)
                   (aref vec pivot-i))
          (incf pivot-i)))
      (rotatef (aref vec (1- (length vec)))
               (aref vec pivot-i))
      (quicksort (rtl:slice vec 0 pivot-i) comp)
      (quicksort (rtl:slice vec (1+ pivot-i)) comp)))
  vec)

;(setf a (make-array 3 :initial-element #((make-course :code "cps305")(make-course :code "cps306")(make-course :code "cps307"))))
(setf (aref a 0) (make-course :code "cps305"))
(setf (aref a 1) (make-course :code "cps306"))
(setf (aref a 2) (make-course :code "cps307"))
(setf a (quicksort a #'(lambda (x y) (string< (course-code x) (course-code y)))))