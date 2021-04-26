# アプリ名
	Nagano-PokemonCenter CakeShop

 ## 説明
	ポケモン好きなShimayanが3匹のポケモンを引き連れて</br>
  プログラミングに挑戦。長野県のケーキ屋さんECサイトを作成しました。</br>
  お客様は商品の注文、支払い、配送先の指定などが可能です。</br>
  管理者側では商品の新規追加、お客様情報管理、製作状況管理などが可能です。

 ## ER図
  ![ER図](https://user-images.githubusercontent.com/79110505/116027710-8e6de400-a690-11eb-8dc1-7d6aeee5a30c.png)

 ## アプリケーション詳細設計図
  * 顧客側
  ![お客様側(customer)](https://user-images.githubusercontent.com/79110505/116029052-6cc22c00-a693-11eb-8da6-b30debbcdef2.PNG)

  * 管理者側
  ![管理者側(admin)](https://github.com/webcamp-pokemon-master/nagano-cake/files/6374296/2.pdf)

 ## 使い方

  $ git clone https://github.com/webcamp-pokemon-master/nagano-cake
	$ cd nagano-cake
	$ bundle install
	$ rails db:migrate
	$ rails s

	  * 管理者側ログイン(https://27f9643b77ab40f3a3df87031e8b9c6b.vfs.cloud9.us-east-1.amazonaws.com/admins/sign_in)
	  * お客様側ログイン(https://27f9643b77ab40f3a3df87031e8b9c6b.vfs.cloud9.us-east-1.amazonaws.com/customers/sign_in)


# 開発環境
  **Ruby on Rails**

# 推薦環境
  Ruby 2.5 以降 Rails 5.2 以降

# 開発者

  ## チーム名
  **ポケモンマスター**

  ## メンバー
  * **Shimayan**
  ![カスミ](https://user-images.githubusercontent.com/79110505/116030829-6afa6780-a697-11eb-8511-69e087ec38aa.png)
  * **Masa**
  ![ピカチュウ](https://user-images.githubusercontent.com/79110505/116030874-85344580-a697-11eb-9aa0-b4ff0b7a5a59.jpg)
  * **Kohei**
	![ゼニガメ](https://user-images.githubusercontent.com/79110505/116030978-c0367900-a697-11eb-86fd-504898d147d5.png)
	* **Kei**
	![ヒノアラシ](https://user-images.githubusercontent.com/79110505/116030848-76e62980-a697-11eb-88cc-52a569848742.jpg)