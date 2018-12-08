# Automation

Automation scripts for:
* getting started on a new machine

I always end up running (And having to figure out) the same commands over and over each time I set up a new machine. So now I'm trying to maintain those commands here so I can run a single file and have my entire dev environment set up.

## Warning
Piping to bash can be dangerous. I wrote these scripts, so I trust them. You may not want to do that.

## Set up Linux
```
wget -O - https://raw.githubusercontent.com/JustinDFuller/setup/master/ubuntu.sh | sudo bash
```

## Set up Mac
```
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/macosx.sh | sudo bash
```
