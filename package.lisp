(defpackage gnotify
  (:use #:cl)
  (:export #:init
           #:initted-p
           #:uninit
           #:make
           #:show
           #:hide
           #:update
           #:closed-reason
           #:id
           #:app-name
           #:icon-name
           #:body
           #:summary
           #:set-urgency
           #:set-timeout
           #:set-hint))
