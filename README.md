
# Lenovo Yoga Slim 7 Charge Management and Conservation Mode for Linux
Battery conservation management shell script for Yoga Slim 7 computers in Ubuntu. I run the Ryzen 7 4700U version, but it likely will work for most Ryzen-powered IdeaPads. 

## What this does
This script controls the Battery Conservation feature exposed by [Lenovo Vantage](https://www.microsoft.com/en-us/p/lenovo-vantage/9wzdncrfj4mv?activetab=pivot:overviewtab). This feature increases battery life (while disabling Rapid Charge). While active, it appears that charging is disabled, so my script disables Rapid Charge (and enables Conservation Mode) while charging, once the charge level exceeds 80%, to extend the battery lifespan. You can edit the script and increase the number from `80` to whatever value you want, to increase the amount of charge.

## Installation
These instructions are for Ubuntu 20.04. They'll probably work with most Ubuntu installs, but if you use a different distro, you may need to modify these.
This script must run as root (*not* sudo). If ran manually, switch to root before running (`sudo -i`).
To make this script seamless, I recommend running it in a cronjob. So, basically:

1. download `conservation-mode.sh`, navigate to the folder and run `chmod +x conservation-mode.sh`
2. run `sudo cp conservation-mode.sh /usr/bin/` to copy the script into your user application folder.
3. run `sudo crontab -e` to edit your root crontab
4. add the following line to the end of your crontab: `* * * * * /usr/bin/conservation-mode.sh`. This will run the script every minute.

## Thanks
Thanks to [Zanna and Sai Krishnan](https://askubuntu.com/a/1260276/436996) for the location that exposes the IdeaPad Battery Conservation flag.
