;;;; See H5Opublic.h .

(in-package #:hdf5-cffi)

(defcenum h5o-type-t
  (:H5O-TYPE-UNKNOWN -1)
  :H5O-TYPE-GROUP
  :H5O-TYPE-DATASET
  :H5O-TYPE-NAMED-DATATYPE
  :H5O-TYPE-NTYPES)

(defcstruct h5o-hdr-info-struct1-t
  (total hsize-t)
  (meta hsize-t)
  (mesg hsize-t)
  (free hsize-t))

(defcstruct h5o-hdr-info-struct2-t
  (present :uint64)
  (shared :uint64))

(defcstruct h5o-hdr-info-t
  (version :unsigned-int)
  (nmesgs :unsigned-int)
  (nchunks :unsigned-int)
  (flags :unsigned-int)
  (space h5o-hdr-info-struct1-t)
  (mesg h5o-hdr-info-struct2-t))

(defcstruct h5o-info-struct-t
  (obj h5-ih-info-t)
  (attr h5-ih-info-t))

(defcstruct h5o-info-t
  (fileno :unsigned-long)
  (addr haddr-t)
  (type h5o-type-t)
  (rc :unsigned-int)
  (atime time-t)
  (mtime time-t)
  (ctime time-t)
  (btime time-t)
  (num-attrs hsize-t)
  (hdr h5o-hdr-info-t)
  (meta-size h5o-info-struct-t))

(defcfun "H5Oclose" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Close"
  (object-id hid-t))

(defcfun "H5Ocopy" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Copy"
  (src-loc-id hid-t)
  (src-name :string)
  (dst-loc-id hid-t)
  (dst-name :string)
  (ocpypl-id hid-t)
  (lcpl-id hid-t))

(defcfun "H5Oexists_by_name" htri-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-ExistsByName"
  (loc-id hid-t)
  (name :string)
  (lapl-id hid-t))

(defcfun "H5Oget_info" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-GetInfo"
  (object-id hid-t)
  (object-info (:pointer h5o-info-t)))

(defcfun "H5Oget_info_by_name" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-GetInfoByName"
  (loc-id hid-t)
  (object-name :string)
  (object-info (:pointer h5o-info-t))
  (lapl-id hid-t))

(defcfun "H5Olink" herr-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Link"
  (object-id hid-t)
  (new-loc-id hid-t)
  (new-link-name :string)
  (lcpl hid-t)
  (lapl hid-t))

(defcfun "H5Oopen" hid-t
  "http://www.hdfgroup.org/HDF5/doc/RM/RM_H5O.html#Object-Open"
  (loc-id hid-t)
  (name :string)
  (lapl-id hid-t))