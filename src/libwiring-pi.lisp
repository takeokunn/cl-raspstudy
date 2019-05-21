(defpackage cl-raspstudy
    (:use :cl))
(in-package :cl-raspstudy)

(define-foreign-library libwiringPi
    (:unix "libwiringPi.so"))

(cffi:use-foreign-library libwiringPi)

;; Core function

(cffi:defcfun "wiringPiSetupGpio" :int)
(cffi:defcfun "pinMode" :void (pin :int) (mode :int))
(cffi:defcfun "digitalWrite" :void (pin :int) (value :int))
(cffi:defcfun "delay" :void (howlong :uint))
(cffi:defcfun "pullUpDnControl" :void (pin :int) (pud :int))
(cffi:defcfun "digitalRead" :int (pin :int))

;; I2C Library

(cffi:defcfun "wiringPiI2CSetup" :int (fd :int))
(cffi:defcfun "wiringPiI2CWriteReg8" :int (fd :int) (reg :int) (data :int))
(cffi:defcfun "wiringPiI2CReadReg16" :int (fd :int) (reg :int))
