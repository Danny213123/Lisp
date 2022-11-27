(defvar current)(defvar depth 0)(defvar zxczzz)(defvar true nil)(defvar a)(defvar ad)(defvar fl '((1 . 2)(2 4 3)(4)(3 . 1)(5 . 2)(6 . 5)))(defvar visited '())

(defun next-state (std key)(setf ad (cdr(assoc key std)))(return-from next-state ad))


(defun test (mn cur)(if (equal (next-state fl zxczzz) nil) (return-from test nil))(setf current (next-state fl cur))
    (if (equal (member current visited) nil)(setf visited (cons current visited))(return-from test nil))(if (equal current zxczzz)
    (progn(setf true t)(return-from test t)))(if (typep current 'list)(dolist (x current)(if (equal x zxczzz)(progn(setf true t)(return-from test t)))
                                                                      (test mn x))(test mn current)))


(defun has-loop (a f)(setf fl a)(setf zxczzz f)(test a f)(if (equal true t)(progn(setf true nil)(setf visited '())(return-from has-loop t)))
)

(print (has-loop '((1 . (2 3 4 9)) (2) (9)(3 . 5) (5 . (8 6)) (8 . 10) (10) (6 . (1 11)) (11 . 7)(4 . 13) (13 . 7) (7 . 4)) 1))
