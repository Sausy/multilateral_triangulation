; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude mode_msg.msg.html

(cl:defclass <mode_msg> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:boolean
    :initform cl:nil)
   (sync_mode
    :reader sync_mode
    :initarg :sync_mode
    :type cl:boolean
    :initform cl:nil)
   (sync_enable
    :reader sync_enable
    :initarg :sync_enable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass mode_msg (<mode_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mode_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mode_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name triangulation_msg-msg:<mode_msg> is deprecated: use triangulation_msg-msg:mode_msg instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <mode_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:id-val is deprecated.  Use triangulation_msg-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <mode_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:mode-val is deprecated.  Use triangulation_msg-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'sync_mode-val :lambda-list '(m))
(cl:defmethod sync_mode-val ((m <mode_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:sync_mode-val is deprecated.  Use triangulation_msg-msg:sync_mode instead.")
  (sync_mode m))

(cl:ensure-generic-function 'sync_enable-val :lambda-list '(m))
(cl:defmethod sync_enable-val ((m <mode_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:sync_enable-val is deprecated.  Use triangulation_msg-msg:sync_enable instead.")
  (sync_enable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mode_msg>) ostream)
  "Serializes a message object of type '<mode_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mode) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sync_mode) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sync_enable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mode_msg>) istream)
  "Deserializes a message object of type '<mode_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sync_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sync_enable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mode_msg>)))
  "Returns string type for a message object of type '<mode_msg>"
  "triangulation_msg/mode_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mode_msg)))
  "Returns string type for a message object of type 'mode_msg"
  "triangulation_msg/mode_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mode_msg>)))
  "Returns md5sum for a message object of type '<mode_msg>"
  "e2e08abfaa655bc1b5e56f4201c7cfe0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mode_msg)))
  "Returns md5sum for a message object of type 'mode_msg"
  "e2e08abfaa655bc1b5e56f4201c7cfe0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mode_msg>)))
  "Returns full string definition for message of type '<mode_msg>"
  (cl:format cl:nil "uint8 id~%#0 master broadcast, 1 slave broadcast~%bool mode~%#0 sync slave,       1 sync master~%bool sync_mode~%bool sync_enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mode_msg)))
  "Returns full string definition for message of type 'mode_msg"
  (cl:format cl:nil "uint8 id~%#0 master broadcast, 1 slave broadcast~%bool mode~%#0 sync slave,       1 sync master~%bool sync_mode~%bool sync_enable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mode_msg>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mode_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'mode_msg
    (cl:cons ':id (id msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':sync_mode (sync_mode msg))
    (cl:cons ':sync_enable (sync_enable msg))
))
