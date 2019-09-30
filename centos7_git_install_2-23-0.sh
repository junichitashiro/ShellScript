# --------------------------------------------------
# CentOS7(Vagrant)へのGitインストール
# 実行ユーザ：vagrant
# --------------------------------------------------
sudo yum -y remove git
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf

# Gitの取得
wget https://www.kernel.org/pub/software/scm/git/git-2.23.0.tar.gz
# 取得したファイルの展開
tar vfx git-2.23.0.tar.gz
cd git-2.23.0
# インストールの事前チェックとコンパイル
make configure
./configure --prefix=/usr
make all
# インストールの実行
sudo make install
