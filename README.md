# satokennga
common lispでとりあえず動くgenetic algorithmを実装してみた。  

# 動かし方  
ターミナルを開いて  
git clone https://github.com/satoukennta-cit/satokennga  
cd satokennga  
clisp
(load "satokennga")  
(run-gene1 ???)  

???のところは世代数を入力する。  
(run-gene1 10)と入力すれば10世代分のgenetic algorithmを行う。  

# 特徴
手続き型を貫いたつもり。  
擬似的なランキング選択を採用している。  
交叉の方法は一様交叉を実装している。  
  
# これからやること 
いろいろある。  

# 改良点
ver.2.00  
sbcl上で動くようにしました。  
clgplotで適応度をグラフ表示できるようにしました。  
バグを修正  

ver.　1.00~1.02  
汚物  


