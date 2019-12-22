# RAW 現像

自分用

1. ここに `$F.RAF` を置く
1. `make $F` を叩く
    - とりあえずのデフォルト設定 `profiles/mydefault.pp3` を使った現像が行われる
    - `$F.jpg` と `$F.jpg.pp3` が出来上がる
1. 適宜 `$F.jpg.pp3` を編集してまた `make $F` を叩く
    - `$F.jpg` を確認しながら満足行くまで繰り返す
1. `make $F.water.jpg` で左下にアレを入れる
