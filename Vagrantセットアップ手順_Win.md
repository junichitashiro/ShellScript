# WindowsのVagrantセットアップ手順  
* [ドットインストール](https://dotinstall.com/)を参考に作成した手順

***
## VirtualBoxのインストール  
* 下記VirtualBoxのダウンロードページへアクセス  
[https://www.virtualbox.org/wiki/Downloads]  
Windows用インストーラ「VirtualBox x.x.xx for Windows hosts x86/amd64」をダウンロードしてインストーラを実行  
※x.x.xxはバージョン

***
## Vagrantのインストール  
* 下記Vagrantのダウンロードページへアクセス  
[http://www.vagrantup.com/downloads.html]  
WINDOWSカテゴリから「Universal (32 and 64-bit)」をダウンロードしてインストーラを実行

***
## Box作成の準備  
* コマンドプロンプトからVagrantのBox用ディレクトリを作成
```bat
mkdir MyVagrant
cd MyVagrant
```
* Boxごとにディレクトリ分けしたほうが管理しやすいため各Box用のディレクトリを作成
```bat
mkdir local-centos7
cd local-centos7
```

## Boxを追加  
* 下記のBox公開ページへアクセス  
[http://www.vagrantbox.es/]  
対象となるBoxのURLをコピーしておく

* Boxの追加  
vagrant box add [Box名] [コピーしたBoxのURL]
```bat
vagrant box add local-centos7 [コピーしたBoxのURL]
```
* Boxの初期化  
vagrant init [Box名]  
コマンド実行後Box名のディレクトリにVagrantfileが作成される
```bat
vagrant init local-centos7
```

***
## Vagrantfileの編集  
* 作成されたVagrantfileの下記の行をコメントインして保存する
* ブラウザから下記アドレスを指定するとWEBサーバとしてアクセスできるようになる
```bash
# config.vm.network "private_network", ip: "192.168.33.10"
```

## ホストOSとゲストOSのフォルダを共有する設定（任意）  
* ホスト端末の"share"フォルダとゲスト端末の"/tmp/share"フォルダを共有する設定  
なお[create: true]はフォルダがなかった場合作成するオプション
```bash
config.vm.synced_folder "./share", "/tmp/share", owner: "vagrant", group: "vagrant" , create: true
```

***
## Boxの起動  
* Vagrantfileと同一のディレクトリでコマンドを実行  
```bat
vagrant up
```

## ターミナルからBoxにアクセス  
* Boxが起動している状態でTeraTermなどからアクセスする
```
TCP/IP ホスト：127.0.0.1
TCPポート：2222
サービス：SSH SSHバージョン：SSH2
```
```
ログインユーザ：vagrant
パスワード：vagrant
※rootもパスワードは同じ
```
* Vagrantfileの編集を行っている場合は次の設定でもアクセス可能
```
TCP/IP ホスト：192.168.33.10
TCPポート：22
サービス：SSH SSHバージョン：SSH2
```

***
## Vagrantコマンドの一部抜粋  
```bash
vagrant up                  # Boxの起動
vagrant halt                # Boxのシャットダウン
vagrant suspend             # Boxの一時停止
vagrant resume              # 一時停止したBoxの再開
vagrant reload              # Boxの再起動
vagrant ssh-config          # 接続用の設定情報を表示
vagrant status              # Boxの状態を表示
vagrant destroy             # Boxの破棄
vagrant box list            # Boxの一覧を表示
vagrant box remove [Box名]  # Boxの削除
```