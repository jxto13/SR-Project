# HonSSH

HonSSH is a high-interaction Honey Pot solution. 

HonSSH will sit between an attacker and a honey pot, creating two separate SSH connections between them.

# Table of contents
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
        - [Installing Virtual Box](#installing-virtual-box)
        - [Installing Ubuntu Server](#installing-ubuntu-server)
    - [Setup](#setup)
        - [Clone repository](#clone-repository)
        - [Change SSH Port](#change-ssh-port)
        - [Docker postinstall](#docker-postinstall)
        - [Python 2](#python-2)
        - [Dependencies](#dependencies)
        - [Docker manager CLI](#docker-manager-cli)
- [Run Project](#run-project)
- [Deployment](#deployment)
- [License](#license)


## Features
 * Captures all connection attempts to a text file, database or email alerts.
 * When an attacker sends a password guess, HonSSH can automatically replace their attempt with the correct password (spoof_login option). This allows them to login with any password but confuses them when they try to sudo with the same password.
 * All interaction is captured into a TTY log (thanks to Kippo) that can be replayed using the playlog utility included from Kippo.
 * A text based summary of an attackers session is captured in a text file.
 * Sessions can be viewed or hijacked in real time (again thanks to Kippo) using the management telnet interface. 
 * Downloads a copy of all files transferred through wget or scp. 
 * Can use docker to spin up new honeypots and reuse them on ip basis.
 * Saves all modifications made to the docker container by using filesystem watcher.
 * Advanced networking feature to spoof attackers IP addresses between HonSSH and the honeypot.
 * Application hooks to integrate your own output scripts. 

Source - https://github.com/tnich/honssh/wiki

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software:

- Any virtualization software (e.g. VMware Workstation Player, VirtualBox, QEMU, etc.)
- [Ubuntu-20-04 Server ISO](https://ubuntu.com/download/server)


### Installing Virtual Box

A step by step on creating your first virtual machine using [Virtual Box](https://www.virtualbox.org/wiki/Downloads)

**VirtualBox Manager**

![VirtualBox Manager](https://www.virtualbox.org/manual/images/virtualbox-main-empty.png)

**Creating Your First Virtual Machine**

Click New in the VirtualBox Manager window. The Create Virtual Machine wizard is shown.

![Virtual Machine Wizard](https://www.virtualbox.org/manual/images/create-vm-1.png)

- **ISO Image** - Select the ISO image file, Ubuntu-20-04 Server previously mentioned in [prerequisites](#prerequisites).
- **Type and Version** - Select "Linux" for the Type and "Ubuntu 64bit" for the Version. 

**Setup Hardware**

Click "Next", the default values are optimized for your hardware.

![Hardware](https://www.virtualbox.org/manual/images/create-vm-3.png)

**Setup Virtual Hard Disk**

Click "Next", the default value is enought for the project.

![Virtual Hard Disk*](https://www.virtualbox.org/manual/images/create-vm-4.png)

Click "Next" until the end. 

Source - https://www.virtualbox.org/manual/ch01.html

### Installing Ubuntu Server

Start the virtual machine by Double-clicking on the VM's entry in the machine list in VirtualBox Manager.

**Language selection**

![Language selection](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/9/92bda8a0ed1ed1ac3137015191ee81e69c38ff3d.png)

**Refresh**

![Refresh](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/9/924950b31519ac77263f87943c75db0dd70e6ba5.png)

**Keyboard**

![Keyboard](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/d/d18d2a56923b5ced7b2484bd94e9e04ba0c6b0ae.png)

**Network**

![Network](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/2/28369a33c14efbbd4769a17e7235666b4c908d1a.png)


**Proxy**

![Proxy](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/6/6c7f84e37cda91e797f62b61148e10d1aa93c056.png)


**Mirror**

![Mirror](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/3/30b527e810914da07ab11c3448750868809f88ac.png)

**Storage**

![Storage](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/7/7484e986d5be44cf83952ede99e2bb8aaf9ed9c7.png)

![Storage2](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/c/cc7abf276409bdb9cb0d653f700785c421afe332.png)

**Identity**

![Identity](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/9/9e79b5ead9b27622c6eccb3e075bbafc8d6644dd.png)

The default user will be an administrator, able to use sudo

**SSH**

![SSH](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/f/fb7af722915a3fd55954df01e8ea418846055123.png)

Select "Install OpenSSH server".

**Snaps**

![Snaps](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/3/3bd814edad81fbdfd8a13d3c8b5e79eb2a55293c.png)

Select "docker".

**Installation logs**

![Installation logs](https://ubuntucommunity.s3.dualstack.us-east-2.amazonaws.com/original/2X/2/2e77da21332fcf631c1995271b58518a87b2dbd1.png)

Reboot and the installation is complete.

Source - https://ubuntu.com/server/docs/install/step-by-step



## Setup

### Clone repository

    git clone https://github.com/jxto13/SR-Project.git
    cd SR-Project
    git checkout sr-project

### Change SSH Port

    sudo vi /etc/ssh/sshd_config
        # Change this line
        Port 4500

### Docker postinstall

Postinstall
 
    sudo groupadd docker
    sudo usermod -aG docker $USER

Pull and Build Docker Image

    docker build -t sshd docker/


### Python 2

    # Installing python2 and pip2
    sudo apt install python2 python2-dev
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
    sudo python2 get-pip.py

### Dependencies 
Build and dev tools

    sudo apt install build-essential manpages-dev 

IP Geolocation Installation

    sudo add-apt-repository ppa:maxmind/ppa

    sudo apt install libgeoip1 libgeoip-dev geoip-bin
    
Source - https://github.com/maxmind/geoip-api-c

Create virtualvenv

    pip2 install virtualenv

    python2 -m virtualenv env

    source env/bin/activate

    pip2 install -r requirements.txt

Source - https://docs.docker.com/engine/install/linux-postinstall/



### Docker manager CLI (Optional)
Installation

    curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
    sudo chmod 755 /usr/local/bin/dry

Source - https://github.com/moncho/dry


## Run Project

### SSH-Proxy
    sudo ./honsshctrl.sh start
    

## Deployment

HonSSH is intended to sit between the outside world and the honey pot.

### Operation

                     <-----SSH Connection------>          <-----SSH Connection------>
        
         |----------|        /----------\       |--------|                           |----------|
         | Attacker |--------| Internet |-------| HonSSH |---------------------------| HoneyPot |
         |----------|        \----------/       |--------|                           |----------|

Source - https://github.com/tnich/honssh/wiki/Deployment-Guide/

To deploy this Honeypot, Google Cloud Services was used.

Follow this [Guide](https://cloud.google.com/compute/docs/instances/create-start-instance) to Create and Start a VM. 

We choose to setup a website as the bait, because is very common to scan an website ip for open ports:

Setup a website

    # Install apache server
    sudo apt install apache2

    # Copy website files
    sudo cp -r website/* /var/www/html

Source - https://www.free-css.com/free-css-templates/page285/cial

Than, open a port of your choosing (we used port 2222), you can follow this [Guide]( https://cloud.google.com/vpc/docs/using-firewalls)



## License

This project is licensed under the BSD 3-Clause - see the [LICENSE.md](LICENSE.md) file for details
