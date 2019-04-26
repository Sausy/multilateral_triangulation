; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude master_list.msg.html

(cl:defclass <master_list> (roslisp-msg-protocol:ros-message)
  ((master_id_list
    :reader master_id_list
    :initarg :master_id_list
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass master_list (<master_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <master_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'master_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name triangulation_msg-msg:<master_list> is deprecated: use triangulation_msg-msg:master_list instead.")))

(cl:ensure-generic-function 'master_id_list-val :lambda-list '(m))
(cl:defmethod master_id_list-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:master_id_list-val is deprecated.  Use triangulation_msg-msg:master_id_list instead.")
  (master_id_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <master_list>) ostream)
  "Serializes a message object of type '<master_list>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'master_id_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'master_id_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <master_list>) istream)
  "Deserializes a message object of type '<master_list>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'master_id_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'master_id_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<master_list>)))
  "Returns string type for a message object of type '<master_list>"
  "triangulation_msg/master_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'master_list)))
  "Returns string type for a message object of type 'master_list"
  "triangulation_msg/master_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<master_list>)))
  "Returns md5sum for a message object of type '<master_list>"
  "9fcc051e83933444dfd30c80d8eae2a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'master_list)))
  "Returns md5sum for a message object of type 'master_list"
  "9fcc051e83933444dfd30c80d8eae2a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<master_list>)))
  "Returns full string definition for message of type '<master_list>"
  (cl:format cl:nil "uint32[] master_id_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'master_list)))
  "Returns full string definition for message of type 'master_list"
  (cl:format cl:nil "uint32[] master_id_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <master_list>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'master_id_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <master_list>))
  "Converts a ROS message object to a list"
  (cl:list 'master_list
    (cl:cons ':master_id_list (master_id_list msg))
))
