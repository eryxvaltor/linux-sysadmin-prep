# Download, Install and Configure Linux

## Lab Design

There are two ways to set up a Linux lab.

| Option   | Setup                                                                                                                  |
| -------- | ---------------------------------------------------------------------------------------------------------------------- |
| Option 1 | Host machine (Windows or macOS) + virtualization software (VMware Player, Oracle VirtualBox) → virtual machine → Linux |
| Option 2 | Cloud services (AWS, Google Cloud, Azure) → virtual machine → Linux  (I'm using this option)                           |

## Oracle VirtualBox

### What is VirtualBox?

- Free and open-source **hypervisor** for x86 computers, developed by Oracle
- Installs on an existing Intel or AMD computer running Windows, Mac, Linux or Solaris
- Lets you run multiple operating systems on the same hardware at the same time

```
Hardware
└── Host OS
    └── VirtualBox
        ├── Linux (guest)
        ├── Windows (guest)
        └── MAC (guest)
```

### Download and Installation

Download VirtualBox for your host OS from the Oracle VirtualBox site and run the installer with the default options.

### Creating Your First Virtual Machine

Click **New** at the top of the VirtualBox Manager window. A wizard asks for the minimum information needed to create a VM.

|Wizard step|What to set|
|---|---|
|VM name|Shown in the VM list and used for the VM's files on disk. Use an informative name, e.g. "Windows XP SP2 with OpenOffice" is better than "My VM"|
|Operating System Type|The OS you plan to install. VirtualBox enables or disables VM settings based on this, which matters most for 64-bit guests. Always set it correctly|
|Memory (RAM)|Allocated every time the VM starts. It is taken away from the host while the VM runs|
|Virtual hard disk|A large image file on the real disk, presented to the VM as a complete hard disk|

Memory rule of thumb from the manual: with 1 GB or more of host RAM, 512 MB per VM is usually safe, and always leave at least 256 to 512 MB for the host. Otherwise the host swaps heavily and nearly freezes. The RAM setting can be changed later.

#### Virtual Disk Types

|Type|Behaviour|
|---|---|
|Dynamically allocated|Starts small and grows only as the guest stores data|
|Fixed size|Occupies the full size immediately. More space used, but slightly faster|

The disk image is a single file, so it can be copied to another host and used with another VirtualBox installation. After clicking **Finish**, the new VM appears in the list on the left of the Manager window.

### Running the Virtual Machine

Start a VM by any of these:

- Double-click its entry in the Manager list
- Select it and press **Start**
- Double-click its `.vbox` settings file in the `VirtualBox VMs` folder in your home directory

### First Start

A new VM is empty, so it behaves like a real computer with no OS: it shows a "no bootable operating system" error. The First Start Wizard asks for an installation medium.

|Medium|How|
|---|---|
|Physical CD/DVD|Put it in the host drive and choose "Host drive" in the wizard|
|ISO image|Mount the ISO file directly. VirtualBox presents it to the VM as a CD/DVD-ROM drive, so no burning needed. Use the folder icon to pick the file|

### Keyboard and Mouse Capture

The guest OS expects exclusive control of keyboard and mouse, but the VM shares them with the host. Click inside the VM window to give it control.

|Item|Detail|
|---|---|
|Host key|Releases keyboard and mouse back to the host|
|Default host key|Right Ctrl (left Command on a Mac host)|
|Where to see it|Bottom right of the VM window|

While the VM owns the keyboard, key combinations like Alt-Tab go to the guest instead of the host.

## VMware Workstation Player

Covered in the course as a second virtualization option: download, install and configure VMware Workstation Player, then create a virtual machine the same way (name, OS type, memory, disk, installation medium).

## CentOS vs CentOS Stream

CentOS stands for **Community Enterprise Operating System**.

|Year|Event|
|---|---|
|2004|Started by Greg Kurtzer|
|2014|CentOS joined Red Hat|
|Before Feb 2021|Fedora → RHEL → CentOS|
|After Feb 2021|Fedora → CentOS Stream → RHEL|

So CentOS used to be a downstream rebuild of RHEL, while CentOS Stream sits upstream of RHEL, just ahead of it.

Is it worth learning CentOS? Yes. The course notes that about 80% of the corporate world uses RHEL, and CentOS is the closest free equivalent.

## Download and Install Linux

You can use Ubuntu, Kali or any other Linux, but CentOS is recommended for this course.

|Version|Notes|
|---|---|
|CentOS 7|Used in the install walkthrough below|
|CentOS 8 Stream|Same three steps: create VM, download ISO, install|
|CentOS 9 Stream|Same three steps: create VM, download ISO, install|

Installing on the cloud (Option 2) is skipped in this course.

### Different Ways to Install an OS

|Method|Notes|
|---|---|
|DVD|Boot from a physical disc|
|ISO file|Image file of the disc. Mounted directly in a VM|
|Network boot|Boot from the network card, set in the BIOS boot options|

## CentOS 7 Installation

### What is New in CentOS 7

|Change|Detail|
|---|---|
|Default filesystem|XFS|
|Default JDK|OpenJDK-7|
|Init system|`initd` replaced by `systemd`|
|Kernel|3.10.0|
|Containers|Linux Containers support|
|VMware|Open VMware Tools and 3D graphics drivers|
|Numbering|CentOS 7.0-1406. The 1406 is the release date (June 2014)|

### Before You Start

Download the ISO from the CentOS website. Burn it to a disc and boot from the DVD, or attach the ISO to the VM. A minimal install can also be done from a bootable USB made with Unetbootin.

### Installation Steps

|Stage|What to do|
|---|---|
|Boot menu|Choose **Install CentOS 7** and press Enter. Other entries: Test this media & install CentOS 7, Troubleshooting|
|Language|Choose the language and click Continue|
|Installation Summary|Hub screen for everything below|
|Date & Time|Pick the time zone|
|Keyboard and Language Support|Choose the layout (English US)|
|Installation Source|Leave at auto-detected local media. Network sources (HTTP, HTTPS, FTP, NFS) are only for people who know what they are doing|
|Software Selection|Choose the base environment and add-ons|
|Installation Destination|Pick the disk and choose **I will configure partitioning**|
|Network & Hostname|Turn Ethernet ON, set the hostname (FQDN)|
|Begin Installation|Starts copying packages|
|Root password|Set while installation runs|
|User creation|Create the first user|
|Finish|Click **Reboot**, remove the installation media|

### Installation Summary Screen

|Group|Items|
|---|---|
|Localization|Date & Time, Keyboard, Language Support|
|Software|Installation Source, Software Selection|
|System|Installation Destination, Network & Hostname|

### Software Selection

|Base environment|Purpose|
|---|---|
|Minimal Install|Basic functionality. Add other packages later with `yum groupinstall`|
|Infrastructure Server|Network infrastructure services|
|File and Print Server|File, print and storage server for enterprises|
|Basic Web Server|Static and dynamic web content|
|Virtualization Host|Minimal virtualization host|
|Server with GUI|Server with a graphical interface|
|GNOME Desktop|Intuitive, user-friendly desktop|
|KDE Plasma Workspaces|KDE desktop|
|Development and Creative Workstation|Workstation for development and creative work|

Add-ons for Minimal Install: Compatibility Libraries (for applications built on older CentOS versions), Development Tools, Smart Card Support.

For a server, Minimal Install with Compatibility Libraries is suggested. For a desktop lab, GNOME Desktop is used in the course.

### Partitioning

Choose **I will configure partitioning**, set the scheme to **LVM** and click **Click here to create them automatically**. The installer creates three partitions with the XFS filesystem and puts the logical volumes in one volume group named `centos`.

|Mount point|Type|Example size|
|---|---|---|
|`/boot`|Non-LVM|500 MB|
|`/` (root)|LVM, xfs|Rest of the disk (27 GB on a 30 GB disk)|
|swap|LVM|2.04 GB|

You can add, modify or resize partitions. When finished, click **Done** and then **Accept Changes** on the Summary of Changes prompt.

Disks larger than 2 TB are converted to a GPT partition table automatically. To use GPT on a smaller disk, add `inst.gpt` to the installer boot command line.

### Network and Hostname

- Type the system FQDN (Fully Qualified Domain Name) in the Hostname field
- Switch the Ethernet button ON
- With a DHCP server on the network, settings are configured automatically
- For a server, set a static configuration: click **Configure**, fill in the IPv4 address, netmask, gateway and DNS, click **Save**, switch Ethernet OFF then ON, then **Done**

### Root Password and User

- Click **Begin Installation**, then set a strong root password. A weak password needs **Done** pressed twice
- In **User Creation** enter the full name, username (under 32 characters, no spaces) and password
- Tick **Make this user administrator** to give the user root privileges through `sudo`
- When the installer shows Complete, click **Reboot**. On first login of the GUI install, accept the EULA

### Disable Firewall

Switch to root first (`su root`, then enter the password). Disabling the firewall is only for a lab. On a real server keep another firewall protecting the network.

```bash
systemctl disable firewalld
systemctl stop firewalld
systemctl status firewalld
```

|Command|Effect|
|---|---|
|`systemctl disable firewalld`|Does not start at boot|
|`systemctl stop firewalld`|Stops it now|
|`systemctl status firewalld`|Shows current state|

## VirtualBox Snapshots

A snapshot saves a particular state of a VM so you can go back to it later, even after changing the VM a lot. Unlike a single saved state, you can have many snapshots, and they are preserved.

Open the **Snapshots** button at the top right of the Manager. Before any snapshot, the list only shows **Current state**, the "now" point of the VM.

### Operations

|Operation|How|Effect|
|---|---|---|
|Take|Running VM: Machine menu → Take snapshot. Powered off or saved VM: Snapshots tab → camera icon, or right-click Current State → Take snapshot|Copies the current state. Give it a name and optional description|
|Restore|Right-click a snapshot → Restore|Goes back (or forward) to that exact state. The current state is lost|
|Delete|Right-click a snapshot → Delete|Only frees the disk space used by snapshot data. VM state is unaffected|


### What a Snapshot Contains (for complete beginners)

- A complete copy of the VM settings, including hardware configuration, stored in the machine's XML config file
- The complete state of all attached virtual disks, so changes are undone file by file

## Oracle VM Management (just explore vbox by yourself)

The VirtualBox Manager window has a **Settings** button, a **Machine Tools** area and a **Snapshots** tool. Use Settings to change a VM's RAM, disk and other options after creation.

## Keyboard Keys Used in Linux

In VirtualBox the **Right Ctrl** key is the host key, so it will not be sent to the guest.

### Special Keys

|Key|Explanation|
|---|---|
|Windows|Four-pane wavy window key on a PC|
|Command|Apple key, cloverleaf symbol|
|Menu|Cursor pointing to a menu|
|Esc|Escape|
|F1 to F12|Function keys|
|F13 to F24|Extended function keys|
|Tab|Tab|
|Caps Lock|Capital letters on or off|
|Shift|Shift|
|Ctrl|Control|
|Fn|Function modifier|
|Alt|PC only. Mac has Option|
|Spacebar|Space|
|Arrows|Cursor movement|
|Back Space|Deletes backward|
|Delete|Deletes forward|
|Enter|Enter|
|Prt Scrn|Print screen|
|Scroll Lock|Scroll lock|
|Pause / Break|Pause and break|
|Insert|Insert|
|Home / End|Start and end of line|
|Page Up / Page Down|Scroll a page|
|Num Lock|Number pad on or off|

### Symbols

|Symbol|Names|
|---|---|
|`~`|Tilde|
|`` ` ``|Acute, back quote, grave, grave accent, left quote, open quote, push|
|`!`|Exclamation mark, exclamation point, bang|
|`@`|Ampersat, arobase, asperand, at|
|`#`|Octothorpe, number, pound, sharp, hash|
|`£`|Pound Sterling|
|`€`|Euro|
|`$`|Dollar, generic currency|
|`¢`|Cent|
|`¥`|Chinese/Japanese Yuan|
|`%`|Percent|
|`°`|Degree|
|`^`|Caret, circumflex|
|`&`|Ampersand, epershand, and|
|`*`|Asterisk, multiplication, star|
|`(`|Open or left parenthesis|
|`)`|Close or right parenthesis|
|`-`|Hyphen, minus, dash|
|`_`|Underscore|
|`+`|Plus|
|`=`|Equal|
|`{`|Open brace, squiggly, curly bracket|
|`}`|Close brace|
|`[`|Open bracket|
|`]`|Closed bracket|
|`\|`|Pipe, or, vertical bar|
|`\`|Backslash, reverse solidus|
|`/`|Forward slash, solidus, virgule, whack, division|
|`:`|Colon|
|`;`|Semicolon|
|`"`|Quote, quotation mark, inverted commas|
|`'`|Apostrophe, single quote|
|`<`|Less than, angle bracket|
|`>`|Greater than, angle bracket|
|`,`|Comma|
|`.`|Period, dot, full stop|
|`?`|Question mark|
