#/bin/bash
# --------------------------------------------------
# CentOS7(Vagrant)の初期設定
# 実行ユーザ：vagrant
# --------------------------------------------------

# ホスト名の変更
sudo sh -c "echo 'local-centos7' > /etc/hostname"

# システムの表記を日本語にする
sudo localectl set-locale LANG=ja_JP.UTF-8
source /etc/locale.conf

# タイムゾーンを日本に設定する
sudo timedatectl set-timezone Asia/Tokyo

# ファイアウォールを起動
sudo systemctl restart firewalld.service
sudo systemctl enable firewalld.service

# httpとssh通信を許可
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --zone=public --add-service=ssh --permanent
sudo firewall-cmd --reload

# マニュアルのインストール
sudo yum -y install man
sudo yum -y install man-pages-ja

# Apacheのインストール
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

# SHELLに再ログイン
exec $SHELL -l
