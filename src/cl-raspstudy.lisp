(defpackage cl-raspstudy
    (:use :cl)
    (:export :start :stop :test))
(in-package :cl-raspstudy)

(defvar *app* (make-instance 'ningle:app))

(setf (ningle:route *app* "/")
    "fasdfsafsa")

(defvar *server* nil
    "This variable will store currently running server instance.")

(defun start ()
    (cond ((null *server*)
              (setf *server* (clack:clackup *app*)))
        (t (format t "Server already started"))))

(defun stop ()
    (cond ((null *server*)
              (format t "Server is not running"))
        (t (progn
               (clack:stop *server*)
               (setf *server* nil)))))

(defun test ()
    (cffi:load-foreign-library "./test.so")
    (cffi:foreign-funcall "power"
        :int 4
        :int 2
        :int))
