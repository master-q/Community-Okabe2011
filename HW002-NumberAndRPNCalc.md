課題2：「number」と「rpncalc」
==============================

* 出す日：2011年5月31日
* 答え合わせ：2011年6月8日

[前の課題](HW001-StacksAndQueues.md)で作ったデータ構造をStateモナドと一緒に｛使｝いましょう。

問題1：「number」
-----------------

Stateモナドのウォーミングアップのために単純なプログラムで始まります。`number`というユーティリティは`stdin`から読む行を行数と一緒に表示されます。

例えば、`test.in`というファイルは以下です。

```
one
two
three
```

`number < test.in > test.out`を実行したら、`test.out`というファイルが以下の通りになります。

```
1: one
2: two
3: three
```

このユーティリティの普通の作り方は`zipWith`を使います：

```haskell
main = interact $ unlines . zipWith (\i s -> show i ++ ": " ++ s) [1..] . lines
```

Stateモナドの利用を練習するためにStateモナドで行数の状態を持ってください。

[テストデータ](Projects/number)を用意しています。

問題2：「rpncalc」
------------------

[前の課題](HW001-StacksAndQueues.md)で作ったスタックとStateモナドを使って、[RPN](http://ja.wikipedia.org/wiki/%E9%80%86%E3%83%9D%E3%83%BC%E3%83%A9%E3%83%B3%E3%83%89%E8%A8%98%E6%B3%95)計算機を作ってください。

作る計算機は`Float`を使います。次の演算子を提供してください：

* `+` （足し算）
* `-` （引き算）
* `*` （掛け算）
* `/` （割り算）

次のコマンドを提供してください：

* `display` （スタックの上の番号を表示する）
* `clear` （スタックを空にする）
* `drop` （スタックの`head`を消す）
* `swap` （スタックの上の二つの番号を取り換える）

エラーは次の通りです：

* 番号、演算子、コマンド以外の場合は
  `error: syntax error`
* 引数が足りない場合は
  `error: too few arguments`
* ゼロ除算の場合は
  `error: infinite result`

[テストデータ](Projects/rpncalc/)を用意しています。

ノート
------

テストを自動に実行したいだったら[stdiotest](https://github.com/yuzutechnology/stdiotest)を使えます。
