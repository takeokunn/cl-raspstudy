#|
  This file is a part of cl-raspstudy project.
|#

(defsystem "cl-raspstudy-test"
    :defsystem-depends-on ("prove-asdf")
    :author ""
    :license ""
    :depends-on ("cl-raspstudy"
                    "prove")
    :components ((:module "tests"
                     :components
                     ((:test-file "cl-raspstudy"))))
    :description "Test system for cl-raspstudy"

    :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
