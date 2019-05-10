# CentOS7(Vagrant)の初期設定

# システムのアップデート
sudo yum -y update

# ホスト名の変更
sudo sh -c "echo 'local-centos7' > /etc/hostname"

# システムの表記を日本語にする
sudo localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf

# タイムゾーンを日本に設定する
sudo timedatectl set-timezone Asia/Tokyo

# ファイアウォールをOFF
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

# マニュアルのインストール
sudo yum -y install man
sudo yum -y install man-pages-ja

# Apacheのインストール
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

exec $SHELL -l
