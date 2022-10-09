# Promise

## キーワード
- 同期・非同期
- コールバック
- Promise・then・resolve
- async・await
- reject

<br>

## 同期・非同期
- 逐次実行
  - コードに書いた処理が上から順番に実行される
- 同期
  - プログラムを書いた順番と処理の順番が一致している（=同期している）こと
- 非同期
  - 終わった後の処理を`予約`して次の処理を実行する（プログラムを書いた順番と処理の順番は必ずしも一致しない）
  - 重たい処理が終わるまで待つのではなく、軽い処理を先に実行させたい。他の処理でUIの更新が遅れることもなくなる。

<br>

## コールバック
- 非同期を実現するための手段
- 処理が終わった後に実行される関数

```swift
// コールバックを利用して、処理を順番に実行しようとすると可読性が落ちるコードとなる
func 時間のかかる処理A {
  callback {
    func 時間のかかる処理B {
      callback {

      }
    }
  }
}
```

<br>

## Promise・then・resolve
- 非同期処理を同期処理のように記述することができるもの
- callbackをネストすることなく順番に記述できる

```swift
// 概念
func 時間のかかる処理A {
}
.完了したら(
  func 時間のかかる処理B {
  }
)
.完了したら(
  func 時間のかかる処理C {
  }
)

// Promiseオブジェクト
Promise(
  時間のかかる処理A　　　// `予約 ≒ 約束`
  resolve()
)
.then(
  時間のかかる処理Aが終わった後に実行する処理 // `その結果どうする`
)
.then(
  処理
)
```

- thenはPromiseオブジェクトを返すので数珠繋ぎに記述できる
- then内のreturnでPromiseを返すと一つずつ処理を待って実行される
- ✨ resolveに引数を渡すとthenで受け取ることができる

<br>

## async・await
- async = asynchronous（非同期の）
- await(待つ)

```swift
func () async {
  // 非同期実行される
  // Promiseを返す場合は`await`を使う
  await 処理B
  await 処理C
  await 処理D
  let resultE = await 処理E  // Promiseのresolveの引数に相当する
}
```
※ Swift標準SDKのasync・awaitの文法とは異なる. あくまで概念図.

<br>

## reject

#### Promiseの場合

- resolveの逆
- Promiseのコールバック関数の引数には`resolve（成功通知）`と`reject（失敗通知）`がある
- rejectの通知は`catch`を使って取得する

```swift
Promise(
  時間のかかる処理A
  reject()
)
.then(
  時間のかかる処理Aが終わった後に実行する処理
)
.catch(
  処理B // ここが呼ばれる. thenは呼ばれない.
)
```

- rejectにも引数を設定することは可能. Error型を定義してerror内容を通知するとよい.

#### async・awaitの場合

- try・catchを用いてrejectを行う

```swift
func () async {
  try {
    let result = await 処理B('reject')
  } catch(e) {
    // reject
  }
}
```