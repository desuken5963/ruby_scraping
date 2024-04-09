require 'net/http'

# URLを指定してHTMLを取得するメソッド
def get_from(url)
  Net::HTTP.get(URI(url))
end

# 取得したHTMLを保存
def write_file(path, text)
  File.open(path, 'w') { |file| file.write(text) }
end

write_file('html/pitnews.html', get_from('https://masayuki14.github.io/pit-news/'))
