# CentOS7でのGitセットアップ

# 古いバージョンのGitを削除
sudo yum -y remove git
sudo yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf

# 新しいバージョンのGitをインストール
wget https://www.kernel.org/pub/software/scm/git/git-2.21.0.tar.gz
tar vfx git-2.21.0.tar.gz
cd git-2.21.0
make configure
./configure --prefix=/usr
make all
sudo make install

# Githubからセットアップ用のリポジトリをコピー
mkdir ~/git
cd ~/git
git clone https://github.com/junichitashiro/vm_setup.git
