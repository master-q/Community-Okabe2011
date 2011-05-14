課題1：スタックとキュー
=======================

* 出す日：2011年5月11日
* 答え合わせ：2011年5月25日

基本のデータ構造をHaskellで実装しましょう。

問題1：スタック
---------------

`Stack.hs`というファイルに書いてください。

関数型スタックの型クラスは以下の通りです。各クラスメソッドの型を記入してください。

```haskell
class Stack where
  empty   :: ...
  isEmpty :: ...
  cons    :: ...
  head    :: ...
  tail    :: ...
```

空のスタックを`head`か`tail`に渡した場合はエラーです。

`SimpleStack`という代数的データ型を定義してください。

```haskell
data SimpleStack a = ...
```

`Eq`と`Show`のインスタンス宣言が必要です。

`Stack`のインスタンス宣言で選んだ代数的データ型のための関数型スタックの関数を実装してください。

```haskell
instance Stack SimpleStack where
  ...
```

テストするために[StackTest.hs](DataStructures/Stack-Haskell/StackTest.hs)を使ってください。

問題2：キュー
-------------

`Queue.hs`というファイルに書いてください。

関数型キューの型クラスは以下の通りです。各クラスメソッドの型を記入してください。

```haskell
class Queue where
  empty   :: ...
  isEmpty :: ...
  snoc    :: ...
  head    :: ...
  tail    :: ...
```

空のキューを`head`か`tail`に渡した場合はエラーです。

`SimpleQueue`という代数的データ型を定義してください。

```haskell
data SimpleQueue a = ...
```

`Eq`と`Show`のインスタンス宣言が必要です。

`Queue`のインスタンス宣言で選んだ代数的データ型のための関数型スタックの関数を実装してください。

```haskell
instance Queue SimpleQueue where
  ...
```

テストするために[QueueTest.hs](DataStructures/Queue-Haskell/QueueTest.hs)を使ってください。

ノート
------

`Prelude`モジュールに`head`と`tail`という関数が定義されているので以下の`import`宣言を使う必要です。

```haskell
import Prelude hiding (head, tail)
```

各関数の極限における漸近挙動について考えてください。

純粋関数版も作りたかったら、`SafeStack.hs`と`SafeQueue.hs`で`Maybe`を使って実装してください。テストは[SafeStackTest.hs](DataStructures/SafeStack-Haskell/SafeStackTest.hs)と[SafeQueueTest.hs](DataStructures/SafeQueue-Haskell/SafeQueueTest.hs)です。
