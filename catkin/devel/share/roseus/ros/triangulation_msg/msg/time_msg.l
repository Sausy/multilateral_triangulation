;; Auto-generated. Do not edit!


(when (boundp 'triangulation_msg::time_msg)
  (if (not (find-package "TRIANGULATION_MSG"))
    (make-package "TRIANGULATION_MSG"))
  (shadow 'time_msg (find-package "TRIANGULATION_MSG")))
(unless (find-package "TRIANGULATION_MSG::TIME_MSG")
  (make-package "TRIANGULATION_MSG::TIME_MSG"))

(in-package "ROS")
;;//! \htmlinclude time_msg.msg.html


(defclass triangulation_msg::time_msg
  :super ros::object
  :slots (_id _trigger_time _master_identifier ))

(defmethod triangulation_msg::time_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:trigger_time __trigger_time) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:master_identifier __master_identifier) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _trigger_time __trigger_time)
   (setq _master_identifier __master_identifier)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:trigger_time
   (&optional __trigger_time)
   (if __trigger_time (setq _trigger_time __trigger_time)) _trigger_time)
  (:master_identifier
   (&optional __master_identifier)
   (if __master_identifier (setq _master_identifier __master_identifier)) _master_identifier)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32[] _trigger_time
    (* 4    (length _trigger_time)) 4
    ;; uint32[] _master_identifier
    (* 4    (length _master_identifier)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32[] _trigger_time
     (write-long (length _trigger_time) s)
     (dotimes (i (length _trigger_time))
       (sys::poke (elt _trigger_time i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint32[] _master_identifier
     (write-long (length _master_identifier) s)
     (dotimes (i (length _master_identifier))
       (write-long (elt _master_identifier i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[] _trigger_time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trigger_time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _trigger_time i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint32[] _master_identifier
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _master_identifier (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _master_identifier i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get triangulation_msg::time_msg :md5sum-) "0cd6fad2df199d47f2910a60b352e54d")
(setf (get triangulation_msg::time_msg :datatype-) "triangulation_msg/time_msg")
(setf (get triangulation_msg::time_msg :definition-)
      "uint8 id
float32[] trigger_time
uint32[] master_identifier

")



(provide :triangulation_msg/time_msg "0cd6fad2df199d47f2910a60b352e54d")


