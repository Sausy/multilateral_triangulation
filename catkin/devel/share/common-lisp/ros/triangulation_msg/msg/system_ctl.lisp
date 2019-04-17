; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude system_ctl.msg.html

(cl:defclass <system_ctl> (roslisp-msg-protocol:ros-message)
  ((master_id
    :reader master_id
    :initarg :master_id
    :type cl:fixnum
    :initform 0)
   (enable_slave_input
    :reader enable_slave_input
    :initarg :enable_slave_input
    :type cl:boolean
    :initform cl:nil)
   (trigger_time
    :reader trigger_time
    :initarg :trigger_time
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass system_ctl (<system_ctl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <system_ctl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'system_ctl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name triangulation_msg-msg:<system_ctl> is deprecated: use triangulation_msg-msg:system_ctl instead.")))

(cl:ensure-generic-function 'master_id-val :lambda-list '(m))
(cl:defmethod master_id-val ((m <system_ctl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:master_id-val is deprecated.  Use triangulation_msg-msg:master_id instead.")
  (master_id m))

(cl:ensure-generic-function 'enable_slave_input-val :lambda-list '(m))
(cl:defmethod enable_slave_input-val ((m <system_ctl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:enable_slave_input-val is deprecated.  Use triangulation_msg-msg:enable_slave_input instead.")
  (enable_slave_input m))

(cl:ensure-generic-function 'trigger_time-val :lambda-list '(m))
(cl:defmethod trigger_time-val ((m <system_ctl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:trigger_time-val is deprecated.  Use triangulation_msg-msg:trigger_time instead.")
  (trigger_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <system_ctl>) ostream)
  "Serializes a message object of type '<system_ctl>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'master_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enable_slave_input) 1 0)) ostream)
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <system_ctl>) istream)
  "Deserializes a message object of type '<system_ctl>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'master_id)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enable_slave_input) (cl:not (cl:zerop (cl:read-byte istream))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<system_ctl>)))
  "Returns string type for a message object of type '<system_ctl>"
  "triangulation_msg/system_ctl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'system_ctl)))
  "Returns string type for a message object of type 'system_ctl"
  "triangulation_msg/system_ctl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<system_ctl>)))
  "Returns md5sum for a message object of type '<system_ctl>"
  "b2402184671eaa4cfe66017f90187544")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'system_ctl)))
  "Returns md5sum for a message object of type 'system_ctl"
  "b2402184671eaa4cfe66017f90187544")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<system_ctl>)))
  "Returns full string definition for message of type '<system_ctl>"
  (cl:format cl:nil "uint8 master_id~%bool enable_slave_input~%float32[] trigger_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'system_ctl)))
  "Returns full string definition for message of type 'system_ctl"
  (cl:format cl:nil "uint8 master_id~%bool enable_slave_input~%float32[] trigger_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <system_ctl>))
  (cl:+ 0
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trigger_time) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <system_ctl>))
  "Converts a ROS message object to a list"
  (cl:list 'system_ctl
    (cl:cons ':master_id (master_id msg))
    (cl:cons ':enable_slave_input (enable_slave_input msg))
    (cl:cons ':trigger_time (trigger_time msg))
))
