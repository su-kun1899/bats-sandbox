# bats-sandbox

Bash script のテストに、[bats](https://github.com/sstephenson/bats)をいろいろ試してみるリポジトリ

## template

```bash
#!/usr/bin/env bats

# テスト対象のfunctionファイルを読み込む
# 拡張子が.bashの場合、相対パスで記述し拡張子は省略する
# 拡張子がその他の場合は絶対パスでの記述が必要
load functions

# ケース実行前の処理
# 処理が何もない場合エラーになるので、必要なときだけ実装する
setup() {
  mkdir test_dir
}

# ケース実行後の処理
# 処理が何もない場合エラーになるので、必要なときだけ実装する
teardown() {
  rmdir test_dir
}

@test "sampleメソッドのテスト" {
  # テスト対象処理はrunで実行する
  # runで実行することで、BATSの特殊変数等を利用できる
  run sample_medthod

  # assertはテストコマンドで行う
  # status変数にはrunで実行したコマンドの終了ステータスが格納される
  [ "${status}" -eq 0 ]
  # output変数にはコマンドの出力内容が格納される
  # lines変数には行毎に配列でコマンドの出力内容が格納される
  [ "${lines[0]}" = "Success!" ]
  [ "${lines[1]}" = "処理が正常終了しました" ]
}

@test "sample.shのテスト" {
  # コマンドや関数をmock化したい場合は同名の関数を用意する
  # mock curl
  curl() {
    echo "curl command is called."
    # 常にerrorコードを返す
    return 22
  }
  # mock hoge function
  hoge() {
    # 引数を標準出力するだけ
    echo "hoge: ${1}"
  }

  # スクリプト自体の実行も可能
  run ./sample.sh

  [ "${status}" -eq 22 ]
  [ "${lines[0]}" = "curl command is called." ]
  [ "${lines[1]}" = "hoge: this is sample." ]
}
```

## run

```
bats test_sample.bats
```
