(defpackage cl-raspstudy
    (:use :cl)
    (:export :start :stop :test))
(in-package :cl-raspstudy)

(defvar *app* (make-instance 'ningle:app))

(defconstant +i2c-addr+ #X48)
(defparameter *fd* (wiringPiI2CSetup +i2c-addr+))

(wiringPiI2CWriteReg8 *fd* #X03 #X80)

(defun byte-swap (num-value)
    (let (str-value temp-msb temp-lsb)
        (setq str-value (write-to-string num-value :base 16))
        (setq temp-msb (subseq str-value 0 2))
        (setq temp-lsb (subseq str-value 2))
        (setq str-value (concatenate 'string temp-lsb temp-msb))
        (parse-integer str-value :radix 16)))

(defun get-temperature ()
    (* (byte-swap (wiringPiI2CReadReg16 *fd* #X00)) 0.0078))

(defun test ()
    (get-temperature))

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
