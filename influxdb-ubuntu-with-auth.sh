#retrive username and password
influxdbAdmin=$1
influxdbPassword=$2

echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -

# Install updates
sudo apt-get update
sudo apt-get install -y influxdb

# Enable influxdb at startup
sudo systemctl enable --now influxdb
sudo systemctl is-enabled influxdb

# limiting ports
sudo ufw default deny incoming 
sudo ufw allow 22
sudo ufw allow 53
sudo ufw allow 8086
echo "y" | sudo ufw enable

# Enable authentication auth-enabled = true
sudo sed -i -e 's/# auth-enabled = false/auth-enabled = true/g' /etc/influxdb/influxdb.conf
sudo service influxdb restart

#Set InfluxDB Username and Password
sleep 10
influxCMD="CREATE USER $influxdbAdmin WITH PASSWORD '$influxdbPassword' WITH ALL PRIVILEGES" 
influx -execute="$influxCMD"
