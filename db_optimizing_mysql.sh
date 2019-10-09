#/bin/bash
<< COMMENTOUT
・mysqlcheckコマンドをOSから実行する
・最適化の対象は workbook の全テーブルとする
・最適化の実行前後でテーブルのステータスをログに出力する
・作業の経過が分かるように開始時や終了時にログを出力する
COMMENTOUT

# ログファイルの設定
FILENAME=`date +"%Y%m%d%H%M%S"`
LOG_DIR="/home/script/log/mysql_mainte"
LOG_FILE=${LOG_DIR}/${FILENAME}.log

echo "メンテナンス開始:"`date +%H:%M:%S` > ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化前のステータス" >> ${LOG_FILE}
mysql workbook -u root -proot1 -e "show table status\G" >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化開始:"`date +%H:%M:%S` >> ${LOG_FILE}
echo "" >> ${LOG_FILE}
mysqlcheck workbook --auto-repair --optimize -u root -proot1 >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化完了:"`date +%H:%M:%S` >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化後のステータス" >> ${LOG_FILE}
mysql workbook -u root -proot1 -e "show table status\G" >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "メンテナンス完了:"`date +%H:%M:%S` >> ${LOG_FILE}

exit 0
