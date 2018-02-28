# satokennga
common lispでとりあえず動くgenetic algorithmを実装してみた。  
まだ高速化などをやっていないのでこれから改善していく予定。    

# 動かし方  
ターミナルを開いて  
git clone https://github.com/satoukennta-cit/satokennga  
cd satokennga  
(load "satokennga")  
(run-gene1 ???)  

???のところは世代数を入力する。  
(run-gene1 10)と入力すれば10世代分のgenetic algorithmを行う。  
commmon lispのインストールは省略!  

# 特徴
手続き型プログラミング風を貫いたつもり。  
このアルゴリズムの子の生成メカニズムは以下のとおりである。  

まず、１つの個体は選択されれば何度も親となって子を生成できる。  
擬似的なランキング選択を採用している。  ソートを行い適応度の高い個体から順番に何割かの確率で選択されるかが決まるまで繰り返す。  
交叉の方法は一様交叉を実装している。  
その後の突然変異は親のみに適応され、親と子を混ぜたソートを行い適応度の高いものは残り、低いものはそのまま淘汰される。  
  
# これからやること
適応度と入ったが実装したものは適応度ではなく配列の合計の値そのものを使っているからちゃんとした適応度に変えておく。  
ルーレット選択、トーナメント選択も実装する。  
親は一度選択されると２度と選択できないようなものも実装したい。  
普通のgenetic algorithmも実装したい。  
１点交叉、２点交叉、n点交叉も実装したい。  
エリート戦略も実装したい。  
高速化したい。  
いろいろある。  


