# GNotify

System to send desktop notifications.

## Requirements

- [GLib](https://gitlab.gnome.org/GNOME/glib) installed
- [libnotify](https://github.com/GNOME/libnotify) installed

## Installation

This system can be installed from [UltraLisp](https://ultralisp.org/) like this:

```common-lisp
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload "gnotify")
```

## Usage

```common-lisp
(gnotify:init "test app")
(defvar *n* (gnotify:make "summary text" "body text"))
(gnotify:set-urgency *n* :critical)
(gnotify:set-timeout *n* 600000)
(gnotify:show *n*)
(gnotify:hide *n*)
```
