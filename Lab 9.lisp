(defvar current)(defvar depth 0)
(defvar fl '((1 . 2)(2 4 3)(4)(3 . 1)))
;(defvar ff '((start . test1) (test1 init end1) (init . test2) (test2 bdy return) (bdy . incr) (incr . test2) (return . end1) (end1)))

(defun next-state (std key)
  (setf a (cdr(assoc key std)))
  (return-from next-state a)
  )


(defun test (a f)
    (if (equal (next-state fl f) nil) (return-from test nil))
    (dolist (temp fl)
        (if (equal (car temp) f) (setf current f))
        (if (typep (next-state fl (car temp)) 'list)
            (dolist (temp2 (next-state fl (car temp)))
                (if (and (equal temp2 f) (equal current f)) (return-from test t))
            )
            (progn
                (if (equal (next-state fl ( car temp)) f) (return-from test t))
            )
        )
    )
)


(defun has-loop (a f)
    (setf fl a)
    (test a f)
)

(print (has-loop fl 2))
;(print (has-loop '((1 . 2)(2 . 1)) 2))
;(print(next-state ff 'start))

