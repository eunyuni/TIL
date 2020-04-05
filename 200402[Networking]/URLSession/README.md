# URL Session



## URL

```swift
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString // url의 주소가 string로는 어떤형태인지
url?.scheme // https
url?.host   // itunes.apple.com
url?.path   // /search"
url?.query  // media=music&entity=song&term=Gdragon
url?.baseURL  // nil
// https라는 scheme을 이용해서 host안에 search라는 곳에가서 music이면서 song이고 Gdragon에 관련된 결과물들을 요청하겠다.
```



##  URLComponents

```swift
// URL Components: 퍼센트인코딩에 유용함

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")
var queryItem = URLQueryItem(name: "term", value: "장범준") //term=장범준
urlComponents?.queryItems?.append(queryItem) //()
urlComponents?.url
//https://itunes.apple.com/search?media=music&entity=song&term=%EC%9E%A5%EB%B2%94%EC%A4%80
urlComponents?.string
//"https://itunes.apple.com/search?media=music&entity=song&term=%EC%9E%A5%EB%B2%94%EC%A4%80"
urlComponents?.queryItems 
//[{name "media", value "music"}, {name "entity", value "song"}, {name "term", value "장범준"}]
```



## URLSession

* URLSessionConfiguration
* URLSession
* URLSessionTask 들을 이용해서 서버와 네트워킹
* URLSessionTask
  * dataTask : 기본적인 데이터를 주고받음(백그라운드에 대해 지원이안됨)
  * uploadTask
  * downloadTask

```swift
struct Track {
  let title: String
  let trackName: String
  let trackCensoredName: String
  
  init?(json: [String: Any]) {
    guard let title = json["artistName"] as? String,
      let trackName = json["trackName"] as? String,
      let trackCensoredName = json["trackCensoredName"] as? String else {
        return nil
    }
    self.title = title
    self.trackName = trackName
    self.trackCensoredName = trackCensoredName
  }
}
```





## Codable

```swift
// 쉽게 인코딩 디코딩을 위해 xcode에서 제공
// 위의 코드 및 여러줄을 줄일 수 있게된다.

struct Response: Codable {
  let resultCount: Int
  let results: [Track]
}

struct Track: Codable {
  let title: String
  let trackName: String
  let trackCensoredName: String
  
  enum CodingKeys: String, CodingKey {
    case title = "artistName"
    case trackName = "trackName"
    case trackCensoredName = "trackCensoredName"
  }
}
```

