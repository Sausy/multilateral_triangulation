
(cl:in-package :asdf)

(defsystem "triangulation_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mode_msg" :depends-on ("_package_mode_msg"))
    (:file "_package_mode_msg" :depends-on ("_package"))
    (:file "system_ctl" :depends-on ("_package_system_ctl"))
    (:file "_package_system_ctl" :depends-on ("_package"))
    (:file "time_msg" :depends-on ("_package_time_msg"))
    (:file "_package_time_msg" :depends-on ("_package"))
    (:file "time_sync_msg" :depends-on ("_package_time_sync_msg"))
    (:file "_package_time_sync_msg" :depends-on ("_package"))
  ))