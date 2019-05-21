(defsystem "cl-raspstudy"
    :version "0.1.0"
    :author ""
    :license ""
    :depends-on (:ningle :clack :cl-dbi :cffi)
    :components ((:module "src"
                     :components
                     ((:file "cl-raspstudy" :depends-on ("libwiring-pi"))
                         (:file "libwiring-pi"))))
    :description ""
    :long-description
    #.(read-file-string
          (subpathname *load-pathname* "README.markdown"))
    :in-order-to ((test-op (test-op "cl-raspstudy-test"))))
