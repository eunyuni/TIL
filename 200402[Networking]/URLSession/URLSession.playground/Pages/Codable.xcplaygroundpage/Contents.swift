//: [Previous](@previous)
// Codable



import UIKit

let config = URLSessionConfiguration.default // default를 이용해 서버요청
let session = URLSession(configuration: config)


var urlComponents1 = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")!
var queryItem1 = URLQueryItem(name: "term", value: "장범준")
urlComponents1.queryItems?.append(queryItem1)
let requestURL = urlComponents1.url!

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


func parse(data: Data) -> [Track]? {
  
  do {
    let decoder = JSONDecoder()
    let response = try decoder.decode(Response.self, from: data)
    let trackList = response.results
    return trackList
    
  } catch let error {
    print("--> error: \(error.localizedDescription)")
    return nil
  }
  
}


var trackList: [Track] = []

let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
  // Client-side Error
  guard error == nil else { return }
  
  // Server-side Error / statuscode.. / 2xx -> Success
  guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
  let successRange = 200..<300
  
  guard successRange.contains(statusCode) else {
    // successRange안에 statusCode가 포함되고 있냐,
    // serverside error handle
    return
  }
  
  guard let resultData = data else { return }
  // Data > Object ===> Parsing..
  // 데이터에서 원하는 정보를 끄집어내는것
  trackList = parse(data: resultData) ?? []
  print("--> total tracks count: \(trackList.count)")
//  print(trackList[9])
}

dataTask.resume()
//: [Next](@next)
