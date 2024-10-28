sudo mkdir /kaver/ && cd /kaver/
git clone https://github.com/dimonstrik/kaver.git

sudo yum install -y epel-release
sudo yum install -y wget
sudo cd /etc/yum.repos.d && wget https://repo.codeit.guru/codeit.el`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`.repo
yum info httpd
sudo yum remove -y httpd
sudo yum install -y httpd
sudo /usr/sbin/setsebool -P httpd_can_network_connect 1

sudo chgrp apache /kaver/ && sudo chmod g+rwxs /kaver/ && sudo chcon -R -t httpd_log_t /kaver/
sudo touch /kaver/kaver-error.log && sudo chown apache.apache /kaver/kaver-error.log
sudo touch /kaver/kaver-access.log && sudo chown apache.apache /kaver/kaver-access.log

sudo nano /etc/httpd/conf.d/kaver.conf
#sudo chcon -R -t httpd_sys_content_t /var/www/kaver/w

sudo nano /etc/systemd/system/kestrel-kaver.service
sudo systemctl daemon-reload
sudo systemctl start kestrel-kaver.service
sudo journalctl -fu kestrel-kaver.service

sudo systemctl restart httpd