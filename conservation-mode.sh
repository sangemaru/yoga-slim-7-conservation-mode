#!/bin/bash
x=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | grep -o '[[:digit:]]*')
echo "Current battery level is "$x"%"

y=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)
z=$(upower -i $(upower -e | grep 'BAT') | grep -E "state")

if [ $x -gt 80 ] && [ $y -ne 1 ] 
then
  echo "Battery charged, enabling conservation mode"
  sudo echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
elif [ $x -lt 80 ] && [ $y -ne 1 ] && [[ $z == *"discharging"* ]]
then
  echo "Battery discharging, enabling conservation mode"
  sudo echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
elif [ $x -lt 80 ] && [ $y -eq 1 ] && [[ $z == *"charging"* ]]
then
  echo "Charging, enabling rapid charge"
  sudo echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
fi
