(defsystem "gnotify"
  :version "0.1.0"
  :author "Dmitrii Kosenkov"
  :license "MIT"
  :depends-on ("cl-gobject-introspection" "cl-glib")
  :description "System to send desktop notifications"
  :homepage "https://github.com/Junker/gnotify"
  :source-control (:git "https://github.com/Junker/gnotify.git")
  :components ((:file "package")
               (:file "gnotify")))
