(require 'demo-it)

(defun ssh-demo/ssh-keygen ()
  "Generating a ssh key"
  (demo-it-run-in-shell "ssh-keygen -t ed25519-sk -O resident -f ~/.ssh/id_testkey -N '' -C 'test key for'"))

(demo-it-create :fullscreen :single-window :advanced-mode :use-shell :variable-width :windows-below
		(demo-it-presentation "bsides_presentation.org")
		;;About Speaker
		demo-it-presentation-advance
		;;Securing SSH Keys with MFA
		demo-it-presentation-advance
		;;Before we beging...
		demo-it-presentation-advance
		;;What inspired this talk?
		demo-it-presentation-advance
		;;How SSH Authentication Works
		demo-it-presentation-advance
		;;Keys, Keys, and more Keys!
		demo-it-presentation-advance
		;;Public and Private Key Cryptography
		demo-it-presentation-advance
		;;SSH And Yubikey
		demo-it-presentation-advance
		;;SSH and TOTP
		demo-it-presentation-advance
		;;Create SSH Key
		demo-it-presentation-advance
		;;Create a "ed25519" key
		demo-it-presentation-advance
		;;Create an "RSA" key
		demo-it-presentation-advance
		;;Explanation
		demo-it-presentation-advance
		;;Passwords, Passphrase, Passcode??
		demo-it-presentation-advance
		;;Demonstrating SSH Key Generation
		demo-it-presentation-advance
		;;Create a "ed25519-sk" key
		demo-it-presentation-advance
		;;Start Shell
		demo-it-start-shell
		;;Test Example
		(demo-it-run-in-shell "ssh -v")
		;;Function to run ssh keygen
		;;ssh-demo/ssh-keygen
		;;Go back to presentation
		demo-it-presentation-return
		;;Create an SSH Key with TOTP
		demo-it-presentation-advance
		;;MFA is awesome!
		demo-it-presentation-advance
		;;Watch out for these things....
		demo-it-presentation-advance
		;;Tips and Tricks
		demo-it-presentation-advance
		;;Adding SSH Key to Agent
		demo-it-presentation-advance
		;;Check if SSH Agent is running
		demo-it-presentation-advance
		;;Add the Keys to SSH Agent
		demo-it-presentation-advance
		;;Verify Keys Added to SSH Agent
		demo-it-presentation-advance
		;;Copy Key to Remote Server
		demo-it-presentation-advance
		;;Copy Server Key to Host
		demo-it-presentation-advance
		;;SSH Config File - Make SSH Easier
		demo-it-presentation-advance
		;;erobles@10.0.3.11
		demo-it-presentation-advance
		;;-p 2300
		demo-it-presentation-advance
		;;-i ~/.ssh/mykeys
		demo-it-presentation-advance
		;;SSH Config File cont...
		demo-it-presentation-advance
		;; Conclusion
		demo-it-presentation-advance)
		(demo-it-start)
