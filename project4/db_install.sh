#Credit for this shell script goes to SharkeysDevs


#!/bin/sh

# This should install postgres along with dependencies.
#
# If this is not executable, run "chmod u+x ./db_install.sh" from within this folder
# and then try running it. Enter your password if prompted.
# DO NOT RUN THIS SCRIPT AS ROOT.

cur_user=$USER

sudo apt-get update
sudo apt-get install postgresql libpq-dev
gem install pg
sudo -u postgres createuser -s $cur_user

# Under "rails_app_name"/config/database.yml add
#
# username: <%= ENV['USER'] %>
#
# under default, development, and test
