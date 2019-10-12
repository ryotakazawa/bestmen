# BESTMEN -1番だけをシェアしよう-
![bestmen_top](https://user-images.githubusercontent.com/32186329/66702470-ebba7280-ed42-11e9-9ea5-71962bbe4229.png)
BESTMENは、ユーザーが認める１番のラーメン屋を、各ジャンル1店舗ずつのみ投稿し、シェア出来るアプリケーションです。
他のグルメアプリケーションと異なり投稿できる店舗数が限られているので、ハイレベルなお店だけを探すことが出来ます。

# URL
https://thebestmen.net/
トップ画面右上『ログイン』→『かんたんログイン』からワンタッチでテストユーザーとして閲覧可能です。

# 主な機能
◎ユーザー登録◎
* Eメール、ユーザーネーム、パスワードによる通常登録に加え、Twitter,Facebook,Googleアカウントからも登録可能。

◎投稿◎
* １番の店舗を、画像や住所、認定理由と共に投稿出来ます。
* 画像のサイズは自動で最適化されます。
* 住所を別窓でわざわざ調べる必要は無く、ページ内で簡単に検索可能。
* 投稿後も各要素を自由に編集出来ます。

◎閲覧◎
* 投稿一覧orマップから登録された店舗を閲覧できます。エリアや店名、ジャンルから自分が探したいラーメンを簡単にソート可能です。
* GOOGLE MAPと連携しており、現在地から行きたい店舗への経路をGOOGLE MAPアプリ上で簡単に確認出来ます。
* Twitter、Facebook、LINE上にワンタッチでシェア。
* いいね！することによって、その投稿をマイページにストック可能です。
* 投稿へのコメント機能搭載。ユーザー同士で自由に交流できます。
* いいね！およびコメントはajax化されており、ストレスフリーなユーザー体験を実現。

# 使用技術

* Ruby 2.6.3
* Rails 5.1.6
* Nginx
* Puma
* psql(PostgreSQL) 9.2.24
* AWS<br>
  ・Cloud9<br>
  ・Elastic Beanstalk<br>
  ・VPC<br>
  ・EC2<br>
  ・ALB<br>
  ・RDS<br>
  ・S3<br>
  ・Route53<br>
  ・ACM<br>
  ・CloudWatch
* Google API<br>
  ・Maps Javascript API<br>
  ・Geocoding API<br>
  ・Places API
* Twitter API
* Facebook API
<br>
AWSアーキテクチャ図
![aws_architecture](https://user-images.githubusercontent.com/32186329/66702473-f70d9e00-ed42-11e9-96c8-73a16fa1dc45.png)
