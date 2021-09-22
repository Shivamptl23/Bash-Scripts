#!/bin/bash
read -p "Enter package name to check " required_pkg;
pkg_status=$(dpkg-query -W --showformat='${Status}\n' $required_pkg|grep "install ok installed")
echo Checking for $required_pkg: $pkg_status
if [ "" = "$pkg_status" ]; then
  echo "No $required_pkg. Setting up $required_pkg."
  sudo apt-get --yes install $required_pkg
fi
