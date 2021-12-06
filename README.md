# 利用方法
## 概要
本スクリプトは，bash のみを利用して，
マイクラサーバーへの JOIN と LEFT を監視しディスコードへ通知するものです．

## 準備
1. token.txt の作成
```
echo [webhook url] > token.txt
```
2. path.txt の作成
```
echo [latest.logのpath] > token.txt
```
3. 通知の実行間隔はデフォルトで300[sec].
notify.sh 内の span で管理している．


## 実行
1. notify.sh　内の上記設定項目を更新．

2. notify.sh に実行権限を与える．
（例）notify.sh のあるディレクトリで下記コマンドを実行．
```sh
chmod a+x notify.sh
```

3. notify.sh のあるディレクトリで下記コマンドを実行．
```sh
bash notify.sh
```
