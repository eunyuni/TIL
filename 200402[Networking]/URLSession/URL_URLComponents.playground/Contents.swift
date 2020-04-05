import UIKit

// URL & URLComponents

// URL
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString // url의 주소가 string로는 어떤형태인지
url?.scheme // https
url?.host   // itunes.apple.com
url?.path   // /search"
url?.query  // media=music&entity=song&term=Gdragon
url?.baseURL  // nil
// https라는 scheme을 이용해서 host안에 search라는 곳에가서 music이면서 song이고 Gdragon에 관련된 결과물들을 요청하겠다.

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)
// baseURL 뒤에 추가적으로 서치등 붙일내용을 만들 URL
// relativeTo여기에 붙일것이다.

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL // https://itunes.apple.com

// 서버에 요청할때는 api자체가 상태를 표시하는 형태로 구성이된다.
// 보통 베이스를 잡고, relativeurl을 구성해서 네트워킹을 하는것을 활용하길


// URL Components: 퍼센트인코딩에 유용함
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")
var queryItem = URLQueryItem(name: "term", value: "장범준")
urlComponents?.queryItems?.append(queryItem)
urlComponents?.url
urlComponents?.string
urlComponents?.queryItems





