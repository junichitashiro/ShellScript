# MacのVagrantセットアップ手順
* 事前にHomebrewをインストールしておく

***
## Vagrantのインストール  
* Homebrewからインストールする
```bash
brew cask install vagrant
# バージョンの確認
vagrant --version
```

* アップデートの場合
```bash
brew cask reinstall vagrant
```

***
## VirtualBoxのインストール  
* Homebrewからインストールする
```bash
brew cask install VirtualBox
VirtualBox --version
```

* アップデートの場合
```bash
brew cask reinstall VirtualBox
```

***
## CentOS7のセットアップ  
* ディレクトリの作成
```bash
mkdir vagrant
cd vagrant
mkdir local-centos7
```

* Boxの追加（Box名をlocal-centos7とする）
```bash
vagrant box add local-centos7 https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box
```

* Boxの確認
```bash
vagrant box list
```

* Boxの初期化
```bash
vagrant init local-centos7
```

* Vagrantファイルの編集
```bash
# 以下の行をコメントイン
config.vm.network "private_network", ip: "192.168.33.10"
```

* vagrantの実行
```bash
vagrant up
```

***
## セットアップシェルを実行してCentOS7の環境設定をする  
* GitHubからセットアップ用のリポジトリをコピーする
```bash
git clone https://github.com/junichitashiro/vm_setup.git
cd vm_setup
```

* gitのセットアップ
```bash
./centos7_git_setup.sh
```

* CentOS7の初期セットアップ
```bash
./centos7_initial_setup.sh
```