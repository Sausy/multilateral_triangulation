;; Auto-generated. Do not edit!


(when (boundp 'triangulation_msg::time_sync_msg)
  (if (not (find-package "TRIANGULATION_MSG"))
    (make-package "TRIANGULATION_MSG"))
  (shadow 'time_sync_msg (find-package "TRIANGULATION_MSG")))
(unless (find-package "TRIANGULATION_MSG::TIME_SYNC_MSG")
  (make-package "TRIANGULATION_MSG::TIME_SYNC_MSG"))

(in-package "ROS")
;;//! \htmlinclude time_sync_msg.msg.html


(defclass triangulation_msg::time_sync_msg
  :super ros::object
  :slots (_id _sync_time_div _time_div _sys_time ))

(defmethod triangulation_msg::time_sync_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:sync_time_div __sync_time_div) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time_div __time_div) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sys_time __sys_time) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _sync_time_div __sync_time_div)
   (setq _time_div __time_div)
   (setq _sys_time __sys_time)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:sync_time_div
   (&optional __sync_time_div)
   (if __sync_time_div (setq _sync_time_div __sync_time_div)) _sync_time_div)
  (:time_div
   (&optional __time_div)
   (if __time_div (setq _time_div __time_div)) _time_div)
  (:sys_time
   (&optional __sys_time)
   (if __sys_time (setq _sys_time __sys_time)) _sys_time)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32[] _sync_time_div
    (* 4    (length _sync_time_div)) 4
    ;; float32[] _time_div
    (* 4    (length _time_div)) 4
    ;; float32[] _sys_time
    (* 4    (length _sys_time)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32[] _sync_time_div
     (write-long (length _sync_time_div) s)
     (dotimes (i (length _sync_time_div))
       (sys::poke (elt _sync_time_div i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _time_div
     (write-long (length _time_div) s)
     (dotimes (i (length _time_div))
       (sys::poke (elt _time_div i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _sys_time
     (write-long (length _sys_time) s)
     (dotimes (i (length _sys_time))
       (sys::poke (elt _sys_time i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32[] _sync_time_div
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sync_time_div (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sync_time_div i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _time_div
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time_div (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time_div i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _sys_time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sys_time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sys_time i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get triangulation_msg::time_sync_msg :md5sum-) "8fc40ceccbea84cbac12bd27ca06f4f3")
(setf (get triangulation_msg::time_sync_msg :datatype-) "triangulation_msg/time_sync_msg")
(setf (get triangulation_msg::time_sync_msg :definition-)
      "uint8 id
float32[] sync_time_div
float32[] time_div
float32[] sys_time

")



(provide :triangulation_msg/time_sync_msg "8fc40ceccbea84cbac12bd27ca06f4f3")


