# satokennga
sbcl(common lisp)でとりあえず動くgenetic algorithmを実装してみた。  

# 動かし方  
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

# 特徴
手続き型を貫いたつもり。  
擬似的なランキング選択を採用している。  
交叉の方法は一様交叉を実装している。  
  
# これからやること 
いろいろある。  

# 改良点
ver.2.00  
sbclで動くようにしました。  
clgplotで適応度をグラフ表示できるようにしました。  
バグを修正  

ver.　1.00~1.02  
汚物  
