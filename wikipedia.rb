require 'wikipedia'

# 日本語版Wikipediaを利用する
Wikipedia.Configure {
  domain 'ja.wikipedia.org'
  path   'w/api.php'
}

# 記事を取得
page = Wikipedia.find(ARGV[0])

# サマリーを標準出力
puts page.summary
