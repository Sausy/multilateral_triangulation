; Auto-generated. Do not edit!


(cl:in-package triangulation_msg-msg)


;//! \htmlinclude master_list.msg.html

(cl:defclass <master_list> (roslisp-msg-protocol:ros-message)
  ((start_ptp_sync
    :reader start_ptp_sync
    :initarg :start_ptp_sync
    :type cl:boolean
    :initform cl:nil)
   (start_burst
    :reader start_burst
    :initarg :start_burst
    :type cl:boolean
    :initform cl:nil)
   (start_continiouse_mode
    :reader start_continiouse_mode
    :initarg :start_continiouse_mode
    :type cl:boolean
    :initform cl:nil)
   (burst_cycles
    :reader burst_cycles
    :initarg :burst_cycles
    :type cl:integer
    :initform 0)
   (master_id_list
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

(cl:ensure-generic-function 'start_ptp_sync-val :lambda-list '(m))
(cl:defmethod start_ptp_sync-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:start_ptp_sync-val is deprecated.  Use triangulation_msg-msg:start_ptp_sync instead.")
  (start_ptp_sync m))

(cl:ensure-generic-function 'start_burst-val :lambda-list '(m))
(cl:defmethod start_burst-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:start_burst-val is deprecated.  Use triangulation_msg-msg:start_burst instead.")
  (start_burst m))

(cl:ensure-generic-function 'start_continiouse_mode-val :lambda-list '(m))
(cl:defmethod start_continiouse_mode-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:start_continiouse_mode-val is deprecated.  Use triangulation_msg-msg:start_continiouse_mode instead.")
  (start_continiouse_mode m))

(cl:ensure-generic-function 'burst_cycles-val :lambda-list '(m))
(cl:defmethod burst_cycles-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:burst_cycles-val is deprecated.  Use triangulation_msg-msg:burst_cycles instead.")
  (burst_cycles m))

(cl:ensure-generic-function 'master_id_list-val :lambda-list '(m))
(cl:defmethod master_id_list-val ((m <master_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader triangulation_msg-msg:master_id_list-val is deprecated.  Use triangulation_msg-msg:master_id_list instead.")
  (master_id_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <master_list>) ostream)
  "Serializes a message object of type '<master_list>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_ptp_sync) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_burst) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'start_continiouse_mode) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'burst_cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'burst_cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'burst_cycles)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'burst_cycles)) ostream)
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
    (cl:setf (cl:slot-value msg 'start_ptp_sync) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'start_burst) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'start_continiouse_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'burst_cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'burst_cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'burst_cycles)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'burst_cycles)) (cl:read-byte istream))
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
  "7221ac257d3cfe640d16dee9b326535d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'master_list)))
  "Returns md5sum for a message object of type 'master_list"
  "7221ac257d3cfe640d16dee9b326535d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<master_list>)))
  "Returns full string definition for message of type '<master_list>"
  (cl:format cl:nil "bool start_ptp_sync~%bool start_burst~%bool start_continiouse_mode~%uint32 burst_cycles~%uint32[] master_id_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'master_list)))
  "Returns full string definition for message of type 'master_list"
  (cl:format cl:nil "bool start_ptp_sync~%bool start_burst~%bool start_continiouse_mode~%uint32 burst_cycles~%uint32[] master_id_list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <master_list>))
  (cl:+ 0
     1
     1
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'master_id_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <master_list>))
  "Converts a ROS message object to a list"
  (cl:list 'master_list
    (cl:cons ':start_ptp_sync (start_ptp_sync msg))
    (cl:cons ':start_burst (start_burst msg))
    (cl:cons ':start_continiouse_mode (start_continiouse_mode msg))
    (cl:cons ':burst_cycles (burst_cycles msg))
    (cl:cons ':master_id_list (master_id_list msg))
))
