;; Auto-generated. Do not edit!


(when (boundp 'triangulation_msg::master_list)
  (if (not (find-package "TRIANGULATION_MSG"))
    (make-package "TRIANGULATION_MSG"))
  (shadow 'master_list (find-package "TRIANGULATION_MSG")))
(unless (find-package "TRIANGULATION_MSG::MASTER_LIST")
  (make-package "TRIANGULATION_MSG::MASTER_LIST"))

(in-package "ROS")
;;//! \htmlinclude master_list.msg.html


(defclass triangulation_msg::master_list
  :super ros::object
  :slots (_master_id_list ))

(defmethod triangulation_msg::master_list
  (:init
   (&key
    ((:master_id_list __master_id_list) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _master_id_list __master_id_list)
   self)
  (:master_id_list
   (&optional __master_id_list)
   (if __master_id_list (setq _master_id_list __master_id_list)) _master_id_list)
  (:serialization-length
   ()
   (+
    ;; uint32[] _master_id_list
    (* 4    (length _master_id_list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _master_id_list
     (write-long (length _master_id_list) s)
     (dotimes (i (length _master_id_list))
       (write-long (elt _master_id_list i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _master_id_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _master_id_list (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _master_id_list i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get triangulation_msg::master_list :md5sum-) "9fcc051e83933444dfd30c80d8eae2a2")
(setf (get triangulation_msg::master_list :datatype-) "triangulation_msg/master_list")
(setf (get triangulation_msg::master_list :definition-)
      "uint32[] master_id_list

")



(provide :triangulation_msg/master_list "9fcc051e83933444dfd30c80d8eae2a2")


