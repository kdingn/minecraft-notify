#!/bin/bash

# ログファイルパス
path=/data/logs/latest.log

# 間隔の指定 [s]
span=300

# notifyer
notify(){
  url=https://discord.com/api/webhooks/916524788762157076/nwYp9qKZvuvQZlB253STJ0USKOQrO9-rFO3ZRilxoZ3qyfRZQvNXZ_8BD9OZb1Xhp_4a
  #url=https://discord.com/api/webhooks/915626907914108939/YOzhShq33Iw9oUCYeOJUqfVb9LjI_wE2m2Gi6ubFvX-6MLN5EnLsuetwAkunfN8eTN1U
  curl -H "Content-Type: application/json" -X POST -d '{"username": "minecraftBot", "content":"'"$1"'"}' "$url"
}

# hh:mm:dd を 秒 に変換
seconds(){
    all=$1
    hh=$((${all:0:2}*3600))
    mm=$((${all:3:2}*  60))
    ss=$((${all:6:2}*   1))
    echo $((hh+mm+ss))
}



# 一定間隔で実行
while true; do
  # 現在時刻
  var_t=(`date`)
  var_t=$(seconds ${var_t[3]})

  # create sentence
  LINES=""
  exec < $path
  while read line; do
    # now - log
    var_l=$(seconds ${line:1:8})
    var_s=$(($var_t - $var_l))
    if [ $var_s -le 0 ] ; then
      var_s=$((var_s + 24*3600))
    fi
    # 一定時間内のログに絞り込み
    if [ $var_s -le $span ] ; then
      if [[ $line == *joined\ the\ game* ]]; then LINES+="$line \n" ; fi
      if [[ $line == *left\ the\ game* ]]; then LINES+="$line \n" ; fi
    fi
  done
  echo "$LINES"

  # ファイル更新が span 以内の場合に通知を行う
  var_f0=$(date +%s)
  var_f=$(date -r $path +%s)
  if [ $((var_f0-var_f)) -le $span ] ; then
    # notify
    notify "$LINES"
  fi

  # 一定時間待機
  sleep $span
done
