; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude time_sync_msg.msg.html

(cl:defclass <time_sync_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (sync_time_div
    :reader sync_time_div
    :initarg :sync_time_div
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (time_div
    :reader time_div
    :initarg :time_div
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (sys_time
    :reader sys_time
    :initarg :sys_time
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass time_sync_msg (<time_sync_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <time_sync_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'time_sync_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name triangulation_msg-msg:<time_sync_msg> is deprecated: use triangulation_msg-msg:time_sync_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <time_sync_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:id-val is deprecated.  Use triangulation_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'sync_time_div-val :lambda-list '(m))
(cl:defmethod sync_time_div-val ((m <time_sync_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:sync_time_div-val is deprecated.  Use triangulation_msg-msg:sync_time_div instead.")
  (sync_time_div m))

(cl:ensure-generic-function 'time_div-val :lambda-list '(m))
(cl:defmethod time_div-val ((m <time_sync_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:time_div-val is deprecated.  Use triangulation_msg-msg:time_div instead.")
  (time_div m))

(cl:ensure-generic-function 'sys_time-val :lambda-list '(m))
(cl:defmethod sys_time-val ((m <time_sync_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:sys_time-val is deprecated.  Use triangulation_msg-msg:sys_time instead.")
  (sys_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time_sync_msg>) ostream)
  "Serializes a message object of type '<time_sync_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sync_time_div))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'sync_time_div))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'time_div))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'time_div))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sys_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'sys_time))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time_sync_msg>) istream)
  "Deserializes a message object of type '<time_sync_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sync_time_div) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sync_time_div)))
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
  (cl:setf (cl:slot-value msg 'time_div) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'time_div)))
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
  (cl:setf (cl:slot-value msg 'sys_time) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sys_time)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<time_sync_msg>)))
  "Returns string type for a message object of type '<time_sync_msg>"
  "triangulation_msg/time_sync_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'time_sync_msg)))
  "Returns string type for a message object of type 'time_sync_msg"
  "triangulation_msg/time_sync_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<time_sync_msg>)))
  "Returns md5sum for a message object of type '<time_sync_msg>"
  "8fc40ceccbea84cbac12bd27ca06f4f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time_sync_msg)))
  "Returns md5sum for a message object of type 'time_sync_msg"
  "8fc40ceccbea84cbac12bd27ca06f4f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time_sync_msg>)))
  "Returns full string definition for message of type '<time_sync_msg>"
  (cl:format cl:nil "uint8 id~%float32[] sync_time_div~%float32[] time_div~%float32[] sys_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time_sync_msg)))
  "Returns full string definition for message of type 'time_sync_msg"
  (cl:format cl:nil "uint8 id~%float32[] sync_time_div~%float32[] time_div~%float32[] sys_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time_sync_msg>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sync_time_div) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'time_div) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sys_time) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time_sync_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'time_sync_msg
    (cl:cons ':id (id msg))
    (cl:cons ':sync_time_div (sync_time_div msg))
    (cl:cons ':time_div (time_div msg))
    (cl:cons ':sys_time (sys_time msg))
))
