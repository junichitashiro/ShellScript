#/bin/bash

# rootのパスワードを設定
PW="***"

# ログファイルのパス設定
FILENAME=`date +"%Y%m%d%H%M%S"`
LOG_DIR="/home/script/log/mysql_mainte"
LOG_FILE=${LOG_DIR}/${FILENAME}.log

mkdir -p ${LOG_DIR}

echo "メンテナンス開始:"`date +%H:%M:%S` > ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化前のステータス" >> ${LOG_FILE}
mysql workbook -u root -p${PW} -e "show table status\G" >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化開始:"`date +%H:%M:%S` >> ${LOG_FILE}
echo "" >> ${LOG_FILE}
mysqlcheck workbook --auto-repair --optimize -u root -p${PW} >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化完了:"`date +%H:%M:%S` >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "最適化後のステータス" >> ${LOG_FILE}
mysql workbook -u root -p${PW} -e "show table status\G" >> ${LOG_FILE}
echo "" >> ${LOG_FILE}

echo "メンテナンス完了:"`date +%H:%M:%S` >> ${LOG_FILE}

exit 0
