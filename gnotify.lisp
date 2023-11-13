(in-package #:gnotify)

;;  shttps://lazka.github.io/pgi-docs/Notify-0.7/classes/Notification.html

(defvar *gnotify* (gir:require-namespace "Notify"))

(defun make (summary &optional body icon)
  (check-type summary string)
  (check-type body (or null string))
  (check-type icon (or null string))
  (gir:invoke (*gnotify* "Notification" 'new) summary body icon))

;; (defun add-action ()
;;   (notification-add-action instance action callback user-data nil))

(defun init (app-name)
  "Initialized libnotify. This must be called before any other functions."
  (check-type app-name string)
  (gir:invoke (*gnotify* 'init) app-name))

(defun uninit ()
  "Uninitializes libnotify."
  (gir:invoke (*gnotify* 'uninit)))

(defun initted-p ()
  (gir:invoke (*gnotify* 'is_initted)))

(defun show (instance)
  "Tells the notification server to display the notification on the screen."
  (if (not (initted-p))
      (error "Notification system not inited. use 'init' function"))
  (gir:invoke (instance 'show)))

(defun hide (instance)
  "Synchronously tells the notification server to hide the notification on the screen."
  (gir:invoke (instance 'close)))

(defun clear-actions (instance)
  "Clears all actions from the notification."
  (gir:invoke (instance 'clear_actions) nil))

(defun update (instance summary body icon)
  "Updates the notification text and icon."
  (check-type summary string)
  (check-type body (or null string))
  (check-type icon (or null string))
  (gir:invoke (instance 'update) summary body icon))

(defun closed-reason (instance)
  "The reason code for why the notification was closed"
  (case (gir:invoke (instance 'get_closed_reason))
    (-1 :unset)
    (1 :expired)
    (2 :dismissed)
    (3 :api-request)
    (4 :undefiend)))

(defmacro id (instance)
  "The notification ID"
  `(gir:property ,instance 'id))

(defmacro app-name (instance)
  "The application name to use for this notification"
  `(gir:property ,instance 'app-name))

(defmacro icon-name (instance)
  "The icon filename or icon theme-compliant name"
  `(gir:property ,instance 'icon-name))

(defmacro body (instance)
  "The message body text"
  `(gir:property ,instance 'body))

(defmacro summary (instance)
  "The summary text"
  `(gir:property ,instance 'summary))

(defun set-urgency (instance urgency)
  "Sets the urgency level of this notification. (:low :normal :critical)"
  (gir:invoke (instance 'set_urgency) (ecase urgency
                                        (:low 0)
                                        (:normal 1)
                                        (:critical 2))))

(defun set-timeout (instance timeout)
  "Sets the timeout of the notification."
  (check-type timeout fixnum)
  (gir:invoke (instance 'set_timeout) timeout))

(defun set-hint (instance key value)
  "Sets a hint for 'key' with value 'value'."
  (gir:invoke (instance 'set_hint) (etypecase value
                                     (string (glib:make-string-variant :string value))
                                     (float (glib:make-double-variant :value value))
                                     (integer (glib:make-int32-variant :value value)))))
