# 利用方法
本スクリプトは，bash のみを利用して，
マイクラサーバーへの JOIN と LEFT を ディスコードへ通知するものです．

## 設定項目

- span : 実行間隔 [sec]
- url  : ディスコードのウェブフックURL
- path : ログファイルのパス

## 実行
1. notify.sh　内の上記設定項目を更新する．

2. notify.sh に実行権限を与える．
（例）notify.sh のあるディレクトリで下記コマンドを実行．
```
chmod a+x notify.sh
```

3. notify.sh のあるディレクトリで下記コマンドを実行．
```
bash notify.sh
```
