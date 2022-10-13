(defvar total 0)

(defun factorial (n)
    (if (equal n 0)
        (return-from factorial 1)
        (retorm-from factorial (* n (factorial (- n 1))))
    )
)

(defun arith-eval (expr)
  "EXPR is a list of symbols that may include:
square brackets, arithmetic operations, and numbers."
  (setf total 0)
  
  (dolist (item expr)
    ;(print total)
    (case item
      ([ (setf total (+ total 1)))
      (] (setf total (- total 1)))
      )
    )
  
  (if (or (< total 0) (> total 0))
      (return-from arith-eval "Error")
  )
  
  (let ((ops ())
        (vals ())
        (op nil)
        (val nil)
        (x nil)
        (y nil)
        (temp ())
        )
    (dolist (item expr)
      ; (print item)
      (case item
        ([ ) ; do nothing
        ((+ - * / SDIV MAXF FACT ^) (push item ops))
        (] (setf op (pop ops) val (pop vals))
         (case op
           (+ (setf val (+ val (pop vals))))
           (- (setf val (- (pop vals)  val)))
           (* (setf val (* val (pop vals))))
           (/ (setf val (/ (pop vals)  val)))
           (^ (progn
                  (setf val (expt (pop vals) val))
              )
           )
           (SDIV (progn
                   (setf y (pop vals))
                   (setf x (pop vals))
                   (setf val (/ (- x y) val))
                   )
           )
           (MAXF (progn
                   (push (pop vals) temp)
                   (push (pop vals) temp)
                   (push val temp)
                   (dolist (x temp)
                       (if (> x val)
                           (setf val x)
                       )
                   )
                   (setf temp ())
                 )
           )
           (FACT (progn
                      (setf val (factorial val))
                 )
           )
           )
         (push val vals))
        (otherwise (push item vals))))
    (pop vals)))
