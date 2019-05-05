;; Auto-generated. Do not edit!


(when (boundp 'triangulation_msg::mode_msg)
  (if (not (find-package "TRIANGULATION_MSG"))
    (make-package "TRIANGULATION_MSG"))
  (shadow 'mode_msg (find-package "TRIANGULATION_MSG")))
(unless (find-package "TRIANGULATION_MSG::MODE_MSG")
  (make-package "TRIANGULATION_MSG::MODE_MSG"))

(in-package "ROS")
;;//! \htmlinclude mode_msg.msg.html


(defclass triangulation_msg::mode_msg
  :super ros::object
  :slots (_id _mode _sync_mode _sync_enable ))

(defmethod triangulation_msg::mode_msg
  (:init
   (&key
    ((:id __id) 0)
    ((:mode __mode) nil)
    ((:sync_mode __sync_mode) nil)
    ((:sync_enable __sync_enable) nil)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _mode __mode)
   (setq _sync_mode __sync_mode)
   (setq _sync_enable __sync_enable)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:sync_mode
   (&optional __sync_mode)
   (if __sync_mode (setq _sync_mode __sync_mode)) _sync_mode)
  (:sync_enable
   (&optional __sync_enable)
   (if __sync_enable (setq _sync_enable __sync_enable)) _sync_enable)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; bool _mode
    1
    ;; bool _sync_mode
    1
    ;; bool _sync_enable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; bool _mode
       (if _mode (write-byte -1 s) (write-byte 0 s))
     ;; bool _sync_mode
       (if _sync_mode (write-byte -1 s) (write-byte 0 s))
     ;; bool _sync_enable
       (if _sync_enable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _mode
     (setq _mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sync_mode
     (setq _sync_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sync_enable
     (setq _sync_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get triangulation_msg::mode_msg :md5sum-) "e2e08abfaa655bc1b5e56f4201c7cfe0")
(setf (get triangulation_msg::mode_msg :datatype-) "triangulation_msg/mode_msg")
(setf (get triangulation_msg::mode_msg :definition-)
      "uint8 id
#0 master broadcast, 1 slave broadcast
bool mode
#0 sync slave,       1 sync master
bool sync_mode
bool sync_enable

")



(provide :triangulation_msg/mode_msg "e2e08abfaa655bc1b5e56f4201c7cfe0")


