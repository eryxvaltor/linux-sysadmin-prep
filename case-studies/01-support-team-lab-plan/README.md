# Case Study: Linux Lab Plan for a Support Team

## Scenario

- Five-person support team on Windows laptops
- They want to learn Linux server support
- Task: plan a small Linux lab for them

## Parts

| Part | Topic |
| --- | --- |
| 1 | Describe the team |
| 2 | Choose a Linux distribution |
| 3 | Check the team's expectations |
| 4 | Plan how people will use the lab |
| 5 | Submit the complete plan |

## Part 1: Describe the team

Our five-person support team currently uses Windows laptops and wants to learn Linux server support. Before choosing a Linux distribution, we should understand our team's requirements, experience, budget, and the software we need to support. We should also consider whether we need enterprise support, long-term stability, and good documentation. These factors can affect which Linux distribution is suitable for us.

There may be some limitations when moving from Windows to Linux. Not every Windows application is available on Linux, and some familiar tools may need alternatives. Microsoft Office desktop applications, for example, do not have native Linux versions. We will also need time to become familiar with the Linux command line, file permissions, software management, and system administration. However, we do not need to replace our Windows laptops to learn Linux or support Linux servers.

An operating system plays an important role in managing computer hardware and software. It manages CPU and memory resources, files, applications, storage, and network connections. For example, when a user visits a company website, the Linux operating system manages the resources that the web server needs to process the request and deliver the website. It also helps administrators manage user accounts, permissions, and background services.

For our team, I would recommend starting with Ubuntu Server LTS because it is beginner-friendly, has good documentation, and provides long-term support. We could also consider Red Hat Enterprise Linux (RHEL), especially if we later work in an enterprise environment where commercial support and stability are important. These distributions have different package management systems, support options, and release cycles.

Our first learning step should be understanding Linux fundamentals, including the filesystem, distributions, and basic command-line navigation. After that, we can gradually learn user management, file permissions, processes, services, networking, and troubleshooting. This approach will help all five team members build a solid foundation before moving into actual Linux server administration.

## Part 2: Choose a Linux distribution

If we have to compare two Linux distributions, I would choose Ubuntu and RHEL. First of all, Ubuntu is a Debian-based distribution that is widely used in server environments. On the other hand, RHEL is commonly adopted by companies and is designed for enterprise environments where stability and commercial support are important.

Ubuntu uses APT as its package manager, while RHEL uses DNF. Both help administrators install, update, and manage software packages. For our five-person support team, I would recommend Ubuntu Server LTS because it is beginner-friendly, has extensive documentation, and provides long-term security updates. Ubuntu also has community support and paid support options through Canonical.

RHEL provides commercial support through Red Hat subscriptions, making it suitable for organizations that require enterprise-level assistance.

Before using Ubuntu Server, I would check its release version and end-of-standard-support date to make sure it will receive security updates for a sufficient period.

## Part 3: Check the team's expectations

Linux is an open-source operating system based on the Linux kernel. Unix is an older operating system that influenced the design of Linux, but they are not the same thing. The Linux kernel is the core part of the operating system that manages hardware, memory, processes, and other system resources. A Linux distribution is a complete operating system built around the Linux kernel, together with software, package managers, and other tools. For example, Ubuntu and RHEL are two different Linux distributions.

One common misunderstanding is that Linux and Unix are exactly the same. However, Linux is Unix-like, not Unix itself. Another example is that Ubuntu and Kali Linux are not completely different operating systems; they are both distributions that use the Linux kernel but are designed for different purposes.

Since our team currently uses Windows laptops, we should also understand that some familiar Windows applications and habits may work differently in Linux. For example, Microsoft Office desktop applications do not have native Linux versions, and Windows-specific software may require alternatives. Linux also uses different software installation methods, file system structures, and administration tools. Instead of relying mainly on graphical interfaces, we may need to become comfortable using the command line for server administration. However, applications such as Firefox and Chrome are available on Linux, so switching to Linux does not mean losing access to every familiar application.

## Part 4: Plan how people will use the lab

Each person in our team should have their own Linux account instead of sharing one account. This helps maintain security and accountability because we can identify who accessed the system or made changes. Admin access may be needed when installing software, managing system services, changing system configurations, or creating user accounts. However, we should use normal user accounts for daily tasks to reduce security risks.

One business use of Linux is hosting company websites and web applications. Linux is widely used in production environments because it is reliable and supports many server applications.

For our lab, I would choose Ubuntu Server. One benefit is that it is beginner-friendly and has good documentation, so we can easily find learning resources and help when facing problems. One limitation is that a lab environment may not fully represent a real production environment, where we have to deal with multiple users, security requirements, network issues, and unexpected failures.

## Part 5: Final plan

**My final choice:** Ubuntu Server LTS for the team's initial Linux learning, because it is beginner-friendly and has good learning resources.

**Two assumptions**

- All five team members have basic computer knowledge and experience using Windows.
- Our main goal is to learn Linux server administration, not to manage production enterprise servers immediately.

**Two things to check**

- The Ubuntu Server LTS release version and its support lifecycle, to make sure it will receive security updates.
- Whether the software and applications we need are compatible with Ubuntu Server.

**Next steps**

First, we should learn Linux fundamentals, distributions, and the filesystem. After that, we can learn basic command-line navigation, file management, users and groups, permissions, processes, services, networking, and troubleshooting. We should learn these topics step by step so that every team member can build a good foundation before moving into actual Linux server administration.

## What I Learned

- Plan around the team's needs and limits first, then pick the distro
- Ubuntu LTS and RHEL differ in package manager (APT vs DNF), support model, and release lifecycle
- Check the support end date before choosing a release
- Give each person their own account, and keep admin access for tasks that need it
- A lab helps with fundamentals but doesn't reproduce a real production environment
