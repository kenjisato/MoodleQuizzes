# install.packages("exams", repos = "https://r-forge.r-project.org")
library(exams)

# 問題ファイルを保存しているフォルダの名前
# ワーキングディレクトリの直下に exam01 というフォルダがあって，その中に
# 今回使う問題が保存されている。各講義ごとにRStudio のプロジェクトを作るとよい
directory <- "exam01"

# 作成した問題へのパスを保存したベクトル
# 指定したフォルダの全 Rmd ファイルを使う
exercises <- list.files(directory, full.names = TRUE, pattern = "Rmd$")

# HTML と Moodle XML で同じ問題を作りたいので乱数の種を固定する
seed <- sample(1:1000, 1)

# HTML レビュー用の HTMLを作る
# dir パラメータは出力先のフォルダ名を指定。mathjax = TRUE で TeX数式を表示
set.seed(seed)
exams2html(exercises, n = 3, dir = directory, mathjax = TRUE)

# HTMLと同じ乱数の種をセットして乱数を初期化
# 出力ファイルをMoodle にインポートすれば良い
set.seed(seed)
exams2moodle(exercises, n = 3, dir = directory, name = directory)
