;;;; h5-crtatt.lisp

;;; This example illustrates how to create an attribute attached to a
;;; dataset. It depends on the HDF5 file created by h5-crtdat.lisp.
;;; http://www.hdfgroup.org/ftp/HDF5/current/src/unpacked/examples/h5_crtatt.c

(in-package :hdf5-cffi)

(defparameter *FILE* "dset.h5")

(with-foreign-objects ((dims 'hsize-t 1)
		       (attr-data :int 2))

  ;; initialize the attribute data
  (setf (mem-aref attr-data :int 0) 100
	(mem-aref attr-data :int 1) 200
        (mem-aref dims 'hsize-t 0) 2)

  (let*
      ((fapl (h5pcreate +H5P-FILE-ACCESS+))
       (file (prog2
		 (h5pset-fclose-degree fapl :H5F-CLOSE-STRONG)
		 ;; open the file
		 (h5fopen *FILE* '(:rdwr) fapl))))
    (unwind-protect
	 (let*
	     ((dset (h5dopen2 file "/dset" +H5P-DEFAULT+))
	      (shape (h5screate-simple 1 dims (null-pointer)))
	      ;; create the attribute
	      (att (h5acreate2 dset "Units" +H5T-STD-I32BE+ shape
			       +H5P-DEFAULT+ +H5P-DEFAULT+)))
	   ;; write the attribute data
	   (h5awrite att +H5T-NATIVE-INT+ attr-data)
	   (h5aclose att)
	   (h5sclose shape)
	   (h5dclose dset))
      ;; cleanup forms
      (h5fclose file)
      (h5pclose fapl))))

(in-package :cl-user)
