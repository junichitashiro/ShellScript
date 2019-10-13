#/bin/bash
<< COMMENTOUT
・mysqldumpコマンドをOSから実行して処理する
・バックアップ対象は workbook の全テーブルとする
・作業の経過が分かるように開始時や終了時にログを出力する
・ログファイル名はバックアップの成否が分かるように命名する
COMMENTOUT

# rootのパスワードを設定
PW="***"

# バックアップファイルのパス設定
BACKUP_DIR="/home/script/data/mysql_backup"
FILENAME=`date +"%Y%m%d%H%M%S"`

# ログファイルのパス設定
LOG_DIR="/home/script/log/mysql_backup"
TMP_FILE=${LOG_DIR}/${FILENAME}_tmp.log
LOG_FILE=${LOG_DIR}/${FILENAME}.log
ERR_LOG_FILE=${LOG_DIR}/${FILENAME}_error.log

# ディレクトリの作成
mkdir -p ${BACKUP_DIR}
mkdir -p ${LOG_DIR}

echo "バックアップ開始:"`date +%H:%M:%S` > ${TMP_FILE}
echo "" >> ${TMP_FILE}

# バックアップ処理
mysqldump --opt --password=${PW} workbook > ${BACKUP_DIR}/${FILENAME}.sql

if [ $? = 0 ]; then
    echo "バックアップ正常終了:"`date +%H:%M:%S` >> ${TMP_FILE}
    mv ${TMP_FILE} ${LOG_FILE}
else
    echo "バックアップ失敗:"`date +%H:%M:%S` >> ${TMP_FILE}
    mv ${TMP_FILE} ${ERR_LOG_FILE}
fi

exit 0
