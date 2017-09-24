
(defpackage #:hdf5-test
  (:use :cl :fiveam :hdf5))
(in-package #:hdf5-test)

(def-suite :hdf5-cffi)
(in-suite :hdf5-cffi)

(defun load* (name)
  (handler-case
      (progn (load (asdf:system-relative-pathname :hdf5-cffi name))
             (pass))
    (error (c)
      (fail "While running test ~a:~%  ~a" name c))))

(test basics
  (load* "examples/basics/h5-cmprss.lisp")
  (load* "examples/basics/h5-crtdat.lisp")
  (load* "examples/basics/h5-crtatt.lisp")
  (load* "examples/basics/h5-crtgrp.lisp")
  (load* "examples/basics/h5-crtgrpar.lisp")
  (load* "examples/basics/h5-crtgrpd.lisp")
  (load* "examples/basics/h5-extend.lisp")
  (load* "examples/basics/h5-rdwt.lisp")
  (load* "examples/basics/h5-subset.lisp"))

(test datasets
  (load* "examples/datasets/h5ex-d-alloc.lisp")
  (load* "examples/datasets/h5ex-d-checksum.lisp")
  (load* "examples/datasets/h5ex-d-chunk.lisp")
  (load* "examples/datasets/h5ex-d-compact.lisp")
  (load* "examples/datasets/h5ex-d-extern.lisp")
  (load* "examples/datasets/h5ex-d-fillval.lisp")
  (load* "examples/datasets/h5ex-d-gzip.lisp")
  (load* "examples/datasets/h5ex-d-hyper.lisp")
  (load* "examples/datasets/h5ex-d-nbit.lisp")
  (load* "examples/datasets/h5ex-d-rdwr.lisp")
  (load* "examples/datasets/h5ex-d-shuffle.lisp")
  (load* "examples/datasets/h5ex-d-sofloat.lisp")
  (load* "examples/datasets/h5ex-d-soint.lisp")
  (load* "examples/datasets/h5ex-d-szip.lisp")
  (load* "examples/datasets/h5ex-d-transform.lisp")
  (load* "examples/datasets/h5ex-d-unlimadd.lisp")
  (load* "examples/datasets/h5ex-d-unlimgzip.lisp")
  (load* "examples/datasets/h5ex-d-unlimmod.lisp"))

(test datatypes
  (load* "examples/datatypes/h5ex-t-array.lisp")
  (load* "examples/datatypes/h5ex-t-arrayatt.lisp")
  (load* "examples/datatypes/h5ex-t-bit.lisp")
  (load* "examples/datatypes/h5ex-t-bitatt.lisp")
  (load* "examples/datatypes/h5ex-t-cmpd.lisp")
  (load* "examples/datatypes/h5ex-t-cmpdatt.lisp")
  (load* "examples/datatypes/h5ex-t-commit.lisp")
  (load* "examples/datatypes/h5ex-t-convert.lisp")
  (load* "examples/datatypes/h5ex-t-cpxcmpd.lisp")
  (load* "examples/datatypes/h5ex-t-cpxcmpdatt.lisp")
  (load* "examples/datatypes/h5ex-t-enum.lisp")
  (load* "examples/datatypes/h5ex-t-enumatt.lisp")
  (load* "examples/datatypes/h5ex-t-float.lisp")
  (load* "examples/datatypes/h5ex-t-floatatt.lisp")
  (load* "examples/datatypes/h5ex-t-int.lisp")
  (load* "examples/datatypes/h5ex-t-intatt.lisp")
  (load* "examples/datatypes/h5ex-t-objref.lisp")
  (load* "examples/datatypes/h5ex-t-objrefatt.lisp")
  (load* "examples/datatypes/h5ex-t-opaque.lisp")
  (load* "examples/datatypes/h5ex-t-opaqueatt.lisp")
  (load* "examples/datatypes/h5ex-t-regref.lisp")
  (load* "examples/datatypes/h5ex-t-regrefatt.lisp")
  (load* "examples/datatypes/h5ex-t-string.lisp")
  (load* "examples/datatypes/h5ex-t-stringatt.lisp")
  (load* "examples/datatypes/h5ex-t-vlen.lisp")
  (load* "examples/datatypes/h5ex-t-vlenatt.lisp")
  (load* "examples/datatypes/h5ex-t-vlstring.lisp")
  (load* "examples/datatypes/h5ex-t-vlstringatt.lisp"))

(test groups
  (load* "examples/groups/h5ex-g-compact.lisp")
  (load* "examples/groups/h5ex-g-corder.lisp")
  (load* "examples/groups/h5ex-g-create.lisp")
  (load* "examples/groups/h5ex-g-intermediate.lisp")
  (load* "examples/groups/h5ex-g-iterate.lisp")
  (load* "examples/groups/h5ex-g-phase.lisp")
  (load* "examples/groups/h5ex-g-traverse.lisp")
  (load* "examples/groups/h5ex-g-visit.lisp"))
