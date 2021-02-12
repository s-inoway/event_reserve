# README

## アプリケーション名
* イベント予約システム(現在実装中)
## 概要
* 主催者には開催するイベントの告知や、参加募集を投稿することができるアプリケーションです。
* 参加者には投稿されたイベントへの参加や、入場料支払いができるようなアプリケーションです。
## 機能の説明
* イベントを主催するボタンから、開催するイベントの日時、場所、参加人数、入場料を指定し、告知ができます。
*実装後gif添付予定*
* 投稿したイベントは、トップページに掲載され、クリックすることで詳細を見ることができます。
*実装後gif添付予定*
* マイページには投稿したイベントや、参加予約したイベントが並び、イベント内容の編集・削除、予約のキャンセルができます。
*実装後gif添付予定*
* 参加したいイベントがあれば、イベントの詳細画面の参加するボタンから予約ができます。
*実装後gif添付予定*
* 入場料が必要な場合、クレジットカードからの支払いを通して、予約することが可能です。
*実装後gif添付予定*
## URL
*デプロイ後掲載予定*

## テスト用アカウント
### 主催者
| 名前    | メールアドレス     | パスワード   |
| ------ | ---------------- | ---------- |
| 主催者  | shusai@gmail.com | shusa1sha  |
| a      | a@a              | aaaaaaa1   |
### 参加者
| 名前    | メールアドレス    | パスワード   |
| ------ | --------------- | ---------- |
| 参加者  | sanka@gmail.com | 3sankasha  |
| b      | b@b             | bbbbbbb2   |

## Basic認証
| ユーザー名   | パスワード   |
| ---------- | ---------- |
| s-inoway   | 40081134   |

## 目指した課題解決
身近にフリーのレンタルスペースを所有している人がおり、一般の方にに貸して有効活用できないか悩んでいたため、助けになればと思い作成しました。

## 要件定義
### 全ページ共通
- ヘッダー *ログイン時とログアウト時で表示が変化*
  - アプリ名の表示(トップページにリンク)
  - ホームボタン(トップページにリンク)
  - サインインボタン、ログインボタン(ログアウト時のみ)
  - アカウント名(ログイン時のみ表示、クリックでマイページへ)
  - ログアウトボタン(ログイン時のみ)
- メニューバー
  - イベント投稿ボタン
  - イベント検索ボタン

### トップページ
- リンク、ボタンなど
  - 各イベント詳細リンク
  - 過去のイベントボタン
- 表示
  - イベントの告知が日付の近い順に記載されており、クリックするとイベント詳細ページに遷移する
  - すでに終わったイベントは過去のイベント一覧ボタンに格納

### 過去のイベントページ
  - すでに終わったイベントが一覧表示される
  - 各イベントクリックするとイベント詳細のリンクに飛べる

### ログインページ
- 入力欄
  - メールアドレス
  - パスワード
- ログインボタン

### ユーザー新規登録ページ
- 入力欄
  - プロフィール画像(任意)
  - 名前(もしくは団体名)
  - 電話番号(主催する場合、イベント問い合わせ先になる)
  - メールアドレス(主催する場合、イベント問い合わせ先になる)
  - どんな活動をしているか(文章形式)
  - パスワード
  - パスワード確認(入力2回目)
- 会員登録ボタン

### ユーザー情報変更ページ
- UIは新規登録とほぼ同じ
- 会員登録ボタンが変更ボタンに変わる

### マイページ
- リンク、ボタンなど
  - ユーザー登録情報の編集
  - アカウントの削除
- 表示
  - 投稿掲載中のイベントが一覧で表示される(クリックで詳細ページ)
  - 予約中のイベントが一覧で表示される(クリックで詳細ページ)

### イベント入力ページ
- 入力欄
  - イベントタイトル
  - イベントの写真イメージ
  - イベント詳細コメント
  - 開催日時
  - 集合時間
  - 開催場所(施設内の場所をリストで選択)
  - 料金
  - 持ち物
  - 申込締切日時
  - 定員
- 掲載、参加応募するボタン

### イベント詳細ページ
- リンク、ボタンなど *イベントが主催者かそうでないか、申し込んでいるか等でUIが変化*
  - イベント内容編集ボタン(主催者のみ)
  - イベント削除ボタン(主催者のみ)
  - イベントに参加ボタン(主催者以外、未申込)
  - イベント参加キャンセルボタン(主催者以外、申込済)
  - ボタン、リンクなし(申し込み期限をすぎた場合、定員に達している場合)
- 表示 *イベント参加人数が定員に達しているかで表示が変化*
  - イベント入力ページで入力できるものに加え、主催者の情報、問い合わせ先、現在の参加予約人数が表示される
  - 参加人数が定員に達している場合、「定員に達しました」と表示される

### イベント編集ページ
- UIは入力ページとほぼ同じ
- 掲載、参加応募するボタンが変更するボタンに変わる

## データベース設計

### users table
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| tel                | string | null: false               |
| comment            | text   |                           |


* Association
  - has_many :events
  - has_many :joins

### events table
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| title             | string     | null: false                    |
| comment           | text       | null: false                    |
| event_datetime    | datetime   | null: false                    |
| meeting_datetime  | datetime   | null: false                    |
| place_id          | integer    | null: false                    |
| price             | integer    |                                |
| bring             | text       | null: false                    |
| deadline_datetime | datetime   | null: false                    |
| capacity          | integer    | null: false                    |
* Association
  - belongs_to :user
  - has_many :joins


### joins table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| event  | references | null: false, foreign_key: true |
* association
  - belongs_to :user
  - belongs_to :event

## 今後実装予定の機能
* 日付・イベントジャンル別検索機能
* *実装時、何か気付いたらその都度更新予定*
