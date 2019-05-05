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
  :slots (_start_ptp_sync _master_id_list ))

(defmethod triangulation_msg::master_list
  (:init
   (&key
    ((:start_ptp_sync __start_ptp_sync) nil)
    ((:master_id_list __master_id_list) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _start_ptp_sync __start_ptp_sync)
   (setq _master_id_list __master_id_list)
   self)
  (:start_ptp_sync
   (&optional __start_ptp_sync)
   (if __start_ptp_sync (setq _start_ptp_sync __start_ptp_sync)) _start_ptp_sync)
  (:master_id_list
   (&optional __master_id_list)
   (if __master_id_list (setq _master_id_list __master_id_list)) _master_id_list)
  (:serialization-length
   ()
   (+
    ;; bool _start_ptp_sync
    1
    ;; uint32[] _master_id_list
    (* 4    (length _master_id_list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _start_ptp_sync
       (if _start_ptp_sync (write-byte -1 s) (write-byte 0 s))
     ;; uint32[] _master_id_list
     (write-long (length _master_id_list) s)
     (dotimes (i (length _master_id_list))
       (write-long (elt _master_id_list i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _start_ptp_sync
     (setq _start_ptp_sync (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(setf (get triangulation_msg::master_list :md5sum-) "a369acace6dc8a37ac48941231b00c0c")
(setf (get triangulation_msg::master_list :datatype-) "triangulation_msg/master_list")
(setf (get triangulation_msg::master_list :definition-)
      "bool start_ptp_sync
uint32[] master_id_list

")



(provide :triangulation_msg/master_list "a369acace6dc8a37ac48941231b00c0c")


