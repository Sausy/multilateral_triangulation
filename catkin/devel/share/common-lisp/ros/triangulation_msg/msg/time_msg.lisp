; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude time_msg.msg.html

(cl:defclass <time_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (trigger_time_id
    :reader trigger_time_id
    :initarg :trigger_time_id
    :type cl:fixnum
    :initform 0)
   (input_trigger_time
    :reader input_trigger_time
    :initarg :input_trigger_time
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
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

(cl:ensure-generic-function 'trigger_time_id-val :lambda-list '(m))
(cl:defmethod trigger_time_id-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:trigger_time_id-val is deprecated.  Use triangulation_msg-msg:trigger_time_id instead.")
  (trigger_time_id m))

(cl:ensure-generic-function 'input_trigger_time-val :lambda-list '(m))
(cl:defmethod input_trigger_time-val ((m <time_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:input_trigger_time-val is deprecated.  Use triangulation_msg-msg:input_trigger_time instead.")
  (input_trigger_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time_msg>) ostream)
  "Serializes a message object of type '<time_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trigger_time_id)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'input_trigger_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'input_trigger_time))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time_msg>) istream)
  "Deserializes a message object of type '<time_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trigger_time_id)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'input_trigger_time) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'input_trigger_time)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
  "a4a8a4d0923ff59d3433b760d36be60e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time_msg)))
  "Returns md5sum for a message object of type 'time_msg"
  "a4a8a4d0923ff59d3433b760d36be60e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time_msg>)))
  "Returns full string definition for message of type '<time_msg>"
  (cl:format cl:nil "uint8 id~%uint8 trigger_time_id~%float32[] input_trigger_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time_msg)))
  "Returns full string definition for message of type 'time_msg"
  (cl:format cl:nil "uint8 id~%uint8 trigger_time_id~%float32[] input_trigger_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time_msg>))
  (cl:+ 0
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'input_trigger_time) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'time_msg
    (cl:cons ':id (id msg))
    (cl:cons ':trigger_time_id (trigger_time_id msg))
    (cl:cons ':input_trigger_time (input_trigger_time msg))
))
