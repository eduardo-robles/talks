;;; Malicious Link Investigation - Demo
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

(defun mal-demo/daemon-remnux ()
  "run REMnux in a deamon"
  (demo-it-run-in-shell "podman run --rm -d --name clamav --privileged remnux/remnux-distro:focal"))

(defun mal-demo/run-remnux ()
  "run REMnux Container"
  (demo-it-run-in-shell "podman run --rm -it --name malContainer -v /var/home/core/SAMPLES:/home/remnux/files --privileged remnux/remnux-distro:focal bash"))

(defun mal-demo/exec-remnux ()
  "exec into REMnux Container"
  (demo-it-run-in-shell "podman exec -it malContainer -w /home/remnux/files /bin/bash"))

(defun mal-demo/init-clamscan ()
  "initialize/update clamscan"
  (demo-it-run-in-shell "freshclam")) ;; get updated command

(defun mal-demo/init-freshclam ()
  "initialize/update clamscan by freshclam"
  (demo-it-run-in-shell "podman exec -it malContainer /bin/freshclam"))

(defun mal-demo/eml-clamscan ()
  "run Clamscan on eml file"
  (demo-it-run-in-shell "clamscan sample.eml")) ;; use demo-it-shart-shell and the function run-remnux before this function

(defun mal-demo/pdf-clamscan ()
  "run Clamscan on eml file"
  (demo-it-run-in-shell "clamscan sample.pdf")) ;; use demo-it-shart-shell and the function run-remnux before this function

(defun mal-demo/run-thug ()
  "run thug demo"
  (demo-it-run-in-shell "thug -n /tmp -Z -F -u win7chrome49 'https://eduardorobles.com'"))

(defun mal-demo/run-automater ()
  "run automater on link"
  (demo-it-run-in-shell "./Automater.py 'https://eduardorobles.com'"))

(demo-it-create :windows-below :advance-mode :use-shell :variable-width :insert-fast :text-large
		(demo-it-presentation "demo_link_inv.org")
		(demo-it-start-shell)
		;;(demo-it-run-in-shell "ssh malVM")
		;;mal-demo/run-remnux
		;;(demo-it-run-in-shell "cd files")
		mal-demo/run-thug
		(demo-it-run-in-shell "cd /usr/local/automater")
		mal-demo/run-automater
		demo-it-presentation-return-noadvance
		)



(demo-it-start)
