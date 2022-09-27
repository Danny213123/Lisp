(defun a-sum (x y)
  (if (< x y)
      (+ x (a-sum (+ x 1) y))

      (if (= x y) y 0)
    )
 )

(defun sum-odd (x y)
                                        ;(print x)
  (if (<= x y) 
      (if (=(mod x 2) 1)
          (+ x (sum-odd (+ x 1) y))
          (sum-odd (+ x 1) y)
          )
      0)
  )
;

(defun my-function (f)
  (funcall f 1)
  )

(defun sigma (f x y)
  (if (< x y)
      (+ (funcall f x) (sigma f (+ x 1) y))

     (funcall f y))
  )
