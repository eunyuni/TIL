//: [Previous](@previous)

import UIKit

// URLSession

// URLSessionConfiguration
// URLSession
// URLSessionTask  들을 이용해서 서버와 네트워킹

//let config = URLSessionConfiguration.ephemeral
// 크롬이나 사파리의 프라이빗모드 쿠키캐시를 저장하지 않을때 프라이빗한 통신을 해야할 때
//let config = URLSessionConfiguration.background(withIdentifier: "bgdown")
// id를 할당해서 configuration을 구성

let config = URLSessionConfiguration.default // default를 이용해 서버요청
let session = URLSession(configuration: config)


// URLSessionTask
// - dataTask : 기본적인 데이터를 주고받음
// - uploadTask
// - downloadTask


var urlComponents1 = URLComponents(string: "https://itunes.apple.com/search?media=music&entity=song")!
var queryItem1 = URLQueryItem(name: "term", value: "장범준")
urlComponents1.queryItems?.append(queryItem1)
let requestURL = urlComponents1.url!


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

func parse(data: Data) -> [Track]? {
  
  do {
    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
    var parsedTrackList: [Track] = []
    
    if let dictionary = jsonObject as? [String: Any], let tracks = dictionary["results"] as? [[String: Any]] {
      
      parsedTrackList = tracks.compactMap { Track(json: $0) }
      // parsedTrackList = tracks.compactMap { json in return Track(json: json) }
      
//      tracks.forEach ({ (track: [String: Any]) in
//        if let title = track["artistName"] as? String,
//          let trackName = track["trackName"] as? String,
//          let trackCensoredName = track["trackCensoredName"] as? String {
//          let track = Track(title: title, trackName: trackName, trackCensoredName: trackCensoredName)
//          parsedTrackList.append(track)
//        }
//      })
      // print("title: \(title), trackName: \(trackName)") as? String
      // print(dictionary)
      // print("tracks Count: \(tracks.count)")
    }
    return parsedTrackList
    
  } catch let error{
    print("---> error: \(error.localizedDescription)")
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
  print(trackList[9])
}

dataTask.resume()



//: [Next](@next)
