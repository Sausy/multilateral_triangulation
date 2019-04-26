; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude time_msg.msg.html

(cl:defclass <time_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (trigger_time
    :reader trigger_time
    :initarg :trigger_time
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (master_identifier
    :reader master_identifier
    :initarg :master_identifier
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass time_msg (<time_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <time_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'time_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name triangulation_msg-msg:<time_msg> is deprecated: use triangulation_msg-msg:time_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:id-val is deprecated.  Use triangulation_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'trigger_time-val :lambda-list '(m))
(cl:defmethod trigger_time-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:trigger_time-val is deprecated.  Use triangulation_msg-msg:trigger_time instead.")
  (trigger_time m))

(cl:ensure-generic-function 'master_identifier-val :lambda-list '(m))
(cl:defmethod master_identifier-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:master_identifier-val is deprecated.  Use triangulation_msg-msg:master_identifier instead.")
  (master_identifier m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time_msg>) ostream)
  "Serializes a message object of type '<time_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trigger_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'trigger_time))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'master_identifier))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'master_identifier))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time_msg>) istream)
  "Deserializes a message object of type '<time_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trigger_time) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trigger_time)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'master_identifier) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'master_identifier)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<time_msg>)))
  "Returns string type for a message object of type '<time_msg>"
  "triangulation_msg/time_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'time_msg)))
  "Returns string type for a message object of type 'time_msg"
  "triangulation_msg/time_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<time_msg>)))
  "Returns md5sum for a message object of type '<time_msg>"
  "0cd6fad2df199d47f2910a60b352e54d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time_msg)))
  "Returns md5sum for a message object of type 'time_msg"
  "0cd6fad2df199d47f2910a60b352e54d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time_msg>)))
  "Returns full string definition for message of type '<time_msg>"
  (cl:format cl:nil "uint8 id~%float32[] trigger_time~%uint32[] master_identifier~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time_msg)))
  "Returns full string definition for message of type 'time_msg"
  (cl:format cl:nil "uint8 id~%float32[] trigger_time~%uint32[] master_identifier~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time_msg>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trigger_time) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'master_identifier) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'time_msg
    (cl:cons ':id (id msg))
    (cl:cons ':trigger_time (trigger_time msg))
    (cl:cons ':master_identifier (master_identifier msg))
))
