;; Auto-generated. Do not edit!


(when (boundp 'triangulation_msg::system_ctl)
  (if (not (find-package "TRIANGULATION_MSG"))
    (make-package "TRIANGULATION_MSG"))
  (shadow 'system_ctl (find-package "TRIANGULATION_MSG")))
(unless (find-package "TRIANGULATION_MSG::SYSTEM_CTL")
  (make-package "TRIANGULATION_MSG::SYSTEM_CTL"))

(in-package "ROS")
;;//! \htmlinclude system_ctl.msg.html


(defclass triangulation_msg::system_ctl
  :super ros::object
  :slots (_master_id _enable_slave_input _trigger_time ))

(defmethod triangulation_msg::system_ctl
  (:init
   (&key
    ((:master_id __master_id) 0)
    ((:enable_slave_input __enable_slave_input) nil)
    ((:trigger_time __trigger_time) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _master_id (round __master_id))
   (setq _enable_slave_input __enable_slave_input)
   (setq _trigger_time __trigger_time)
   self)
  (:master_id
   (&optional __master_id)
   (if __master_id (setq _master_id __master_id)) _master_id)
  (:enable_slave_input
   (&optional __enable_slave_input)
   (if __enable_slave_input (setq _enable_slave_input __enable_slave_input)) _enable_slave_input)
  (:trigger_time
   (&optional __trigger_time)
   (if __trigger_time (setq _trigger_time __trigger_time)) _trigger_time)
  (:serialization-length
   ()
   (+
    ;; uint8 _master_id
    1
    ;; bool _enable_slave_input
    1
    ;; float32[] _trigger_time
    (* 4    (length _trigger_time)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _master_id
       (write-byte _master_id s)
     ;; bool _enable_slave_input
       (if _enable_slave_input (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _trigger_time
     (write-long (length _trigger_time) s)
     (dotimes (i (length _trigger_time))
       (sys::poke (elt _trigger_time i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _master_id
     (setq _master_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _enable_slave_input
     (setq _enable_slave_input (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _trigger_time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trigger_time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _trigger_time i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get triangulation_msg::system_ctl :md5sum-) "b2402184671eaa4cfe66017f90187544")
(setf (get triangulation_msg::system_ctl :datatype-) "triangulation_msg/system_ctl")
(setf (get triangulation_msg::system_ctl :definition-)
      "uint8 master_id
bool enable_slave_input
float32[] trigger_time

")



(provide :triangulation_msg/system_ctl "b2402184671eaa4cfe66017f90187544")


