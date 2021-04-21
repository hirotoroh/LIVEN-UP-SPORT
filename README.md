# README

## usersテーブル

| Column             | Type    | Option                   |
| ------------------ | ------- | ------------------------ |
| email              | string  | unique: true, null: false|
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| sport              | string  | null: false              | 
| gender             | integer | null: false              | 
| age                | string  | null: false              |

### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    | 
| description       | text       | null: false                    |
| video_url         | string     | null: false                    |  
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

| Column            | Type       | Option                         |
| ----------------- | ---------- | ------------------------------ |
| text              | text     | null: false                    |
| user              | references | null: false, foreign_key: true |
| tweet             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet