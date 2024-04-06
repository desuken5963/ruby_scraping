# ruby_scraping

ruby でのスクレイピングのやり方を残すためのリポジトリ

## リダイレクトされる Web ページへの対処

ページによってはリダイレクトによって別の URL へ飛ばされる場合があり、
以下のような HTML が表示される。

```
<!--
 リダイレクトされるページの例
 httpでアクセスするとhttpsに飛ばされることがあります
-->
<html>
  <head>
    <title>301 Moved Permanently</title>
  </head>
  <body>
    <center><h1>301 Moved Permanently</h1></center>
    <hr><center>nginx</center>
  </body>
</html>
```

この場合、HTTP のヘッダ情報からリダイレクト先の URL を取得し、その URL に再アクセスする必要がある。

- プログラム例
  複数回のリダイレクトに対応するため再帰処理を行う。

```
# Redirectがある場合は再帰処理をします
uri = URI('http://masayuki14.github.io/pit-news/')

def fetch(uri, limit = 5)
  response = Net::HTTP.get_response(uri)

  case response
  when Net::HTTPSuccess
    response
  when Net::HTTPRedirection
    fetch(URI(response['location']), limit - 1)
  else
    response.value
  end
end

puts fetch(uri).body
```
