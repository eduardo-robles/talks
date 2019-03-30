### Welcome to STXLUG Meetup

@fa[calendar] 9-15-18

### Topic: Installing ARCH Linux

---?include=meetups/common/hello.md

---
*Meeting Notes*

* Introduction and news
* Introduction to Arch Linux
* Installation of Arch Linux
	* Disk partitioning
	* GRUB configuration
* Post installation tips
* Closing thoughts
* Wrap up
---

#### Installing Arch Linux
##### Begin Partioning Drive

*Overview*
1. Chose disk
2. Create partion
3. Write changes to disk

---

CHOOSE DISK TO PARTION

```bash
fdisk /dev/sda
``` 

(your disk may differ, `/dev/sda` is an example)

_type_ 

```bash
o
```

(wipes drive)

---

![Choose Desk](img/arch-pres/choseDisk.png)

---
CREATE NEW FIRST PARTION

_type_ 

```bash
n
```

(creates new partion)

---
CREATE A PRIMARY PARTION

_type_ 

```bash
p
```

(p is for primary, e is for extended)

---
SET PARTION NUMBER 
(This first one we will designate as `Root` partion)

_type_ 

```bash
1
```

(1 is for first partion)

---
SET SECTORS FOR THIS PARTION

First Sector [press enter] (leave default)

Last Section _type_ 

```bash
+XG
```

(Choose a size for your `Root` partion, X = Size e.g `+20G`)

---
MAKE PARTION BOOTABLE

_type_
 
```bash
a
``` 

---

![First Partion](img/arch-pres/makePartition.png)

---
CREATE NEW SECOND PARTION

_type_ 

```bash
n
```

(creates new partion)

---
CREATE A PRIMARY PARTION

_type_ 

```bash
p
```

(p is for primary, e is for extended)

---
SET PARTION NUMBER
(This will be designated as `swap` partion)

_type_ 

```bash
2
```

(2 is for first partion)

---
SET SECTORS FOR THIS PARTION

First Sector [press enter] (leave default)
Last Section _type_ 

```bash
+XG
```

(Choose a size for your `swap` partion, 2GB is a good size)

---
SET TYPE FOR SWAP PARTION

_type_ 

```bash
type
``` 

---
CHOSE PARTION

_type_
 
```bash
2
```

---
CHOSE PARTION TYPE
_type_

```bash
82
```

---

![Swap Partion](img/arch-pres/makeSwap.png)

---
CREATE NEW THIRD PARTION

_type_

```bash
n
```

(creates new partion)

---
CREATE A PRIMARY PARTION

_type_ 

```bash
p
```

(p is for primary, e is for extended)

---
SET PARTION NUMBER
(This will be designated as swap partion)

_type_ 

```bash
3
```
(3 is for third partion)

---
SET SECTORS FOR THIS PARTION

First Sector [press enter] (leave default)

Last Section [press enter]
(Choose the remaining space left in the drive for your `/home` partion)

---

![Home Partion](img/arch-pres/makePartition.png)

---

FINALIZE CHANGES

_type_

```bash 
w
```

---

![Write Partion](img/arch-pres/makePartition.png)

---

*Setting Up GRUB*

INSTALL GRUB

```bash
pacman -S grub-bios
```

SET GRUB PARAMATERS

```bash
grub-install --target=i386-pc --recheck /dev/sda
```
[press enter]

```bash
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
```
[press enter]

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```
[press enter]

---?include=meetups/common/goodbye.md
