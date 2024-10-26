;;; Malicious Links Investigation - Demo
;;
;; Author: Eduardo Robles <eduardorobles@proton.me>
;;
;;; Code:
(require 'demo-it)

;; Define functions for use as demo's in the slides
;; (defun name/variable ())

(defun mal-demo/pull-remnux ()
  "pull REMnux Container"
  (demo-it-run-in-shell "podman pull docker.io/remnux/remnux-distro:focal"))

(defun mal-demo/run-remnux ()
  "run REMnux Container"
  (demo-it-run-in-shell "podman run --rm -it -u remnux remnux/remnux-distro:focal bash"))

(defun mal-demo/init-clamscan ()
  "initialize/update clamscan"
  (demo-it-run-in-shell "freshclam")) ;; get updated command

(defun mal-demo/run-clamscan ()
  "run Clamscan on eml file"
  (demo-it-show-shell "clamscan --debug /path/to/emailtoscan.eml")) ;; use demo-it-shart-shell and the function run-remnux before this function

(defun mal-demo/run-thug ()
  "run thug demo"
  (demo-it-run-in-shell "thug -u win7chrome49 https://eduardorobles.com"))

(demo-it-create :windows-below :fullscreen :advance-mode :use-shell :variable-width :insert-fast :text-large
		(demo-it-presentation "mal_inv_containers.org")
		demo-it-presentation-advance
		)



(demo-it-start)
