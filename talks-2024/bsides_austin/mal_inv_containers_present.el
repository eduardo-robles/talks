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

(defun mal-demo/run-clamscan ()
  "run Clamscan on eml file"
  (demo-it-run-in-shell "clamscan sample.eml")) ;; use demo-it-shart-shell and the function run-remnux before this function

(defun mal-demo/run-thug ()
  "run thug demo"
  (demo-it-run-in-shell "thug -u win7chrome49 https://eduardorobles.com"))

(demo-it-create :windows-below :fullscreen :advance-mode :use-shell :variable-width :insert-fast :text-large
		(demo-it-presentation "mal_inv_containers_presentation.org")
		;;Quick, Easy, Malware Investigations and Threat Hunting
		demo-it-presentation-advance
		;;About Me
		demo-it-presentation-advance
		;;Agenda
		demo-it-presentation-advance
		;;Malware Invenstigations
		demo-it-presentation-advance
		;;Why do internal malware analysis?
		demo-it-presentation-advance
		;;Malware is scary and dangerous, put in a box (container)
		demo-it-presentation-advance
		;;Working with malware samples
		;;demo-it-presentation-advance
		;;Demo Defang
		(demo-it-load-file "defang.txt" :below)
		(demo-it-insert "hxxps://eduardorobles[.]com" :slow)
		;;return to presentation
		demo-it-presentation-return
		;;REMnux
		demo-it-presentation-advance
		;;Setup REMnux in a Container
		demo-it-presentation-advance
		;;Install REMnux container
		demo-it-presentation-advance
		;;Run REMnux as a Transient container
		mal-demo/init-freshclam
		demo-it-presentation-advance
		;;Digital Forensics
		demo-it-presentation-advance
		;;Phishing Email Analysis
		demo-it-presentation-advance
		;;ClamAV
		;;demo-it-presentation-quit
		(demo-it-start-shell)
		(demo-it-run-in-shell "ssh malVM")
		mal-demo/exec-remnux
		;;mal-demo/init-clamscan
		mal-demo/run-clamscan
		;;return
		demo-it-presentation-return
		demo-it-presentation-advance
		;;Continued
		demo-it-presentation-advance
		;;Tools
		demo-it-presentation-advance
		;;Cyberchef
		demo-it-presentation-advance
		;;Investigating a malicious link (THUG)
		demo-it-presentation-advance
		;;Continued (Automater)
		demo-it-presentation-advance
		;;Investigating a suspicous PDF
		demo-it-presentation-advance
		;;Threat Hunting
		demo-it-presentation-advance
		;;Setup REMnux container for Analysis
		demo-it-presentation-advance
		;;Conclusion
		demo-it-presentation-advance
		;;Questions
		demo-it-presentation-advance
		;;Thanks
		demo-it-presentation-advance
		)



(demo-it-start)
