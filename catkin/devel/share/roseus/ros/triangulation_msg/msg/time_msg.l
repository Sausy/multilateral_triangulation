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
  :slots (_id _trigger_time _input_trigger_time ))

(defmethod triangulation_msg::time_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:trigger_time __trigger_time) 0)
    ((:input_trigger_time __input_trigger_time) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _trigger_time (round __trigger_time))
   (setq _input_trigger_time __input_trigger_time)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:trigger_time
   (&optional __trigger_time)
   (if __trigger_time (setq _trigger_time __trigger_time)) _trigger_time)
  (:input_trigger_time
   (&optional __input_trigger_time)
   (if __input_trigger_time (setq _input_trigger_time __input_trigger_time)) _input_trigger_time)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _trigger_time
    1
    ;; float32[] _input_trigger_time
    (* 4    (length _input_trigger_time)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint8 _trigger_time
       (write-byte _trigger_time s)
     ;; float32[] _input_trigger_time
     (write-long (length _input_trigger_time) s)
     (dotimes (i (length _input_trigger_time))
       (sys::poke (elt _input_trigger_time i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _trigger_time
     (setq _trigger_time (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[] _input_trigger_time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _input_trigger_time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _input_trigger_time i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get triangulation_msg::time_msg :md5sum-) "f3440e0816b525b8e8331d56821e5953")
(setf (get triangulation_msg::time_msg :datatype-) "triangulation_msg/time_msg")
(setf (get triangulation_msg::time_msg :definition-)
      "uint8 id
uint8 trigger_time
float32[] input_trigger_time

")



(provide :triangulation_msg/time_msg "f3440e0816b525b8e8331d56821e5953")


