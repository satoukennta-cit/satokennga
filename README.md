# satokennga
sbcl(common lisp)でとりあえず動くgenetic algorithmを実装してみた。  

# 動かし方 
eval-ga2に適応度関数を書けばok

(defparameter invididual 300) は個体数
(defparameter point 51) は遺伝子の要素,51で0~50まで
(defparameter gene-length 1000)　遺伝子長
(defparameter elite 1)　エリート戦略の個体数
(defparameter cross-point2 2) 染色体が交差するかの確率　2で2割
(defparameter cross-point 5)　遺伝子１つに対しての一様交叉確率　5で5割
(defparameter mutation-point 1)　突然変異確率 1で1割

そのまま使うならquicklispを導入してclgplotを入れておかないといけません  
common lisp  
ターミナルを開いて  
git clone https://github.com/satoukennta-cit/satokennga  
cd satokennga  
clisp  
(load "satokennga")  
(run-gene1 ???)  

???のところは世代数を入力する。  
(run-gene1 10)と入力すれば10世代分のgenetic algorithmを行う。  

sbclでclgplotを使うにはroswellを導入しないといけません  
https://github.com/roswell/roswell/wiki/Installation#building-from-source  
ubuntuならソースからのビルドで導入できました。  

sbcl  
ターミナルを開いて  
ros run  
(compile-file "satokennga.lisp")  ←もしclgplotでエラーが出たら先に(load "satokennga.lisp")をしてからコンパイルするといいのかも
(load "satokennga.fasl")  
(run-gene1 ???)  
多分早い 

![screenshot from 2018-07-11 22-11-38](https://user-images.githubusercontent.com/34268124/42574047-aad9063a-8558-11e8-87d1-c926204f5945.png)

# 特徴
手続き型を貫いたつもり。  
擬似的なランキング選択を採用している。  
交叉の方法は一様交叉を実装している。  
  
# これからやること 
関数名がひどいねこれ

# 改良点
ver.2,
エリート戦略実装
画像も貼ったよ

ver.2.00  
sbclで動くようにしました。  
clgplotで適応度をグラフ表示できるようにしました。  
バグを修正  

ver.　1.00~1.02  
汚物  
