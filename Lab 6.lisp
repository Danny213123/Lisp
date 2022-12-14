(defvar a)
(defvar z)
(defvar l)
(defvar p)
(defvar result)
(defvar fl
    '((start . test1) (test1 init end1) (init . test2) (test2 bdy return) (bdy . incr) (incr . test2) (return . end1) (end1))
    )

(defun next-state (std key)
  (setf a (cdr(assoc key std)))
  (return-from next-state a)
  )

(defun recur (std s x)
  ;(setf k (list s))
  (if (equal (next-state std x) nil)
      (return-from recur nil)
      (progn
        (if (equal x s)
            (if (equal (next-state std x) nil)
                (return-from recur nil)
                (return-from recur (next-state std x))
                )
            (progn
              (setf z (next-state std x))
              (if (typep z 'list)
                  (dolist (e z)
                    (setf p (recur std s e))
                    (if (equal p nil) () (return-from recur p))
                    )
                  (recur std s (next-state std x))
                  )
              )
            )
        )
      )
  )

(defun jump-state (std s x)
    
    (setf result (recur std s x))
    (if (equal result nil)
        (if (equal result s)
            (return-from jump-state x)
            (return-from jump-state nil)
        )
        (return-from jump-state result)
    )
)

(defun next-fork (std s)
    (if (or (equal s nil) (typep s 'list))
        (return-from next-fork s)
        (next-fork std (next-state std s))
    )
)

(defun interleave (a b)
    (if (equal (length a) 0)(return-from interleave b))
    (if (equal (length b) 0)(return-from interleave a))
    (return-from interleave (cons (car a) (cons (car b) (interleave (cdr a) (cdr b)))))
)

(defun recomb (n k)
    (if (< n 0) (return-from recomb 0))
    (if (or (equal n k) (equal n 0)) (return-from recomb 1)
        (if (and (> n k) (> k 0))
            (return-from recomb (+ (recomb (- n 1) k) (recomb (- n 1) (- k 1))))
            (return-from recomb 1)
        )
    )
)

(defun comb (n k)
    (if (or (equal (recomb n k) 0) (< n k))
        (return-from comb nil)
        (return-from comb (recomb n k))
    )
)

;(print (next-state fl 'test1))
;print (next-state std 'test2))
;(print(jump-state fl nil 'return))
;(print(next-fork fl 'bdy))
;(print (interleave '(1 2 3) '(4)))
(print (comb 3 5))
