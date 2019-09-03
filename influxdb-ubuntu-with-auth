echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -

# Install updates
sudo apt-get update
sudo apt-get install -y influxdb

# Enable influxdb at startup
sudo systemctl enable --now influxdb
sudo systemctl is-enabled influxdb
