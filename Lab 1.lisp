(defvar *balance* 100)

(defun withdraw (amount)
  (cond ((< amount 0) (print "Negative amount"))
        ((= amount 0) (print "Zero value"))
        ((/=(mod amount 20) 0) (print "Withdraw amount is not multiple of 20"))
        ((>= amount 10000) (print "Exceeds maximum withdrawal amount"))
        ((< *balance* amount) (print "Insufficient funds"))
        (t (:= *balance* (- *balance* amount))))
  *balance*)

(defun deposit (amount)
  (cond ((< amount 0) (print "Negative amount"))
        ((>= amount 50000) (print "Deposit higher than limit of 50000"))
        (t (:= *balance* (+ *balance* amount))))
 *balance*)

(defun my-abs (x)
  (abs x)
 )

(defun largest (x y)
  (if (> x y) x y)
 )

(defun dep (b a)
  (if (<  a 10000) (+ a b) nil)
 )

(defun wdr (b a)
  (if (and (>= b a)(< a 10000)) (- b a) (+ b a))
 )
