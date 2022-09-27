(defstruct movie
  title  director year type)

(defparameter *size* 3) 

(defvar *db*)

(defvar f 0)

(setf *db* (make-array *size*  :initial-element nil))

(defun add-movie (m)
  "Adds a movie to *db* and returns *db*"
  (if (and (equal (aref *db* (- *size* 1)) nil) (equal (in-db?(movie-title m)) nil))
      (dotimes (i *size*)
        (when (null (aref *db* i))
          (setf (aref *db* i) m)
          (return *db*)
          )  
        )
      )
  )

(defun num-movies ()
  (setf f 0)
  (dotimes (i *size*)
    (if (equal (aref *db* i) nil)
        (setq f f)
        (setq f (+ f 1))
        )
    )
  (print f)
  )

(defun replace-movie (m nm)
  (if (or (equal (in-db? (movie-title m)) nil) (equal (in-db? (movie-title nm)) *db*))
      (print nil)
      (dotimes (i *size*)
        (when (and (typep (aref *db* i) 'movie) (equal (movie-title(aref *db* i)) (movie-title m)))
          (setf(aref *db* i) nm)
          (return t)
          )
        )
      )
  )

(defun delete-movie (title)
  (dotimes (i *size*)
    (when (and (typep (aref *db* i) 'movie) (equal (movie-title(aref *db* i)) title))
      (if (equal i (- *size* 1))
          (progn
            (setf (aref *db* i ) nil)
            (return title)
            )
          (if (equal i 0)
              (progn
                (print (aref *db* i ) )
                (print (aref *db* (+ i 1) ) )
                (print (aref *db* (+ i 2) ) )
                (setf (aref *db* i ) (aref *db* (+ i 1)))
                (setf (aref *db* (+ i 1)) (aref *db* (+ i 2)))
                (setf (aref *db* (+ i 2)) nil)
                (return title)
                )
              (progn
                (setf (aref *db* i ) (aref *db* (+ i 1)))
                (setf (aref *db* (+ i 1)) nil)
                (return title)
                )
              )
          )
      )
    )
  )

(defun in-db? (title)
  "Returns *db* if movie title is in the database; otherwise returns NIL"
  (dotimes (i *size*)
    (when (and (typep (aref *db* i) 'movie) (equal (movie-title (aref *db* i)) title))
      (return *db*))))
