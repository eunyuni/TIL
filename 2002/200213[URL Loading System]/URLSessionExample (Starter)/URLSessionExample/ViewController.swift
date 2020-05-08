//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    let url = URL(string: imageUrlStr)! // url로 접근해서 데이터를 가져옴
    
    DispatchQueue.global().async { // 비동기처럼 처리가 가능
      if let data = try? Data(contentsOf: url) { // sync메서드, 이작업이 끝나야 다른것을 할 수 있다.
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data)  // ui관련을 global에서처리하면 앱이죽음!!!
          // ui관련 작업은 Main에서 진행하도록..
        }
      }
    }
    
    //    URLSession.shared.dataTask(with: url) { (data, r, e) in
    //      if let data = data {
    //        DispatchQueue.main.async {
    //          self.imageView.image = UIImage(data: data)
    //        }
    //      }
    //    }.resume() // task는 원하는 시점에 resume를 해줘야함.
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /*
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
     */
    // 위 URL 구성을 보고 URLComponents의 각 파트를 수정해 위 구성과 같도록 만들어보기
    
    var components = URLComponents()
    //    components.host = "www.example.com"
    //    print(components)
    //    components.path = "/index.html"    // path는 /로 시작해야 함
    //    print(components)
    //    components.percentEncodedFragment = "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment"
    //    print(components)
    components.scheme = "http"
    print(components)
    components.user = "username"
    print(components)
    components.password = "password"
    print(components)
    components.host = "www.example.com"
    print(components)
    components.path = "/index.html"
    print(components)
    components.port = 80
    print(components)
    components.query = "key1=value1&key2=value2"
    print(components)
    components.fragment = "myFragment"
    print(components)
    
    var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment")
    comp?.queryItems = [
      URLQueryItem(name: "name", value: "tory"),
      URLQueryItem(name: "age", value: "7"),
    ]
//    print(comp?.url)
    print(comp?.url?.absoluteString ?? "")
  }
  
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    // 영어주소
    let urlStringE = "https://search.naver.com/search.naver?query=ios"
    if let url = URL(string: urlStringE) {
      print(url)
    } else {
      print("Nil")
    }
    
    // 한글주소 -> 한글은 아스키코드가아닌경우 인코딩이 필요
    let urlStringK = "https://search.naver.com/search.naver?query=한글"
    print(URL(string: urlStringK) ?? "Nil")
    
    // 한글주소 -> 퍼센트 인코딩
    let str = "https://search.naver.com/search.naver?query=한글"
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! // query의 allowed! 쿼리에 대해서만 인코딩함
    //withAllowedCharacters -> 인코딩을 할것인데 규칙을 어떤것으로 할건지 골라라
    let convertedURL = URL(string: queryEncodedStr)!
    print(convertedURL)
    
    
    // URL -> String
    let encodedUrlString = "https://example.com/#color-%23708090"
    // %23 -> # 으로 인코딩 (% 인코딩 제거)
    print(encodedUrlString.removingPercentEncoding ?? "")
    
    
    // String -> URL
    let originalString = "color-#708090"
    
    // 원하는 곳에서 퍼센트 인코딩이 필요한 경우
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#") // 허용할 문자를 추가
    
    let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: allowed)!
    // 특정경우 문자그대로 사용하기위해 allowed범위를 늘려줄 수 있다.
    let encodedStr = originalString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
    print(encodedString)
    print(encodedStr)
  }
  
  
  
  // MARK: - Session Configuration
  
  // 필요에 따라 설정값들을 간직하여 url세션에 전달해주도록 하는것 -> sessionConfig
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral // 임시, 세션을 사용하는 동안 오는 데이터를 남기지 않는
    _ = URLSessionConfiguration.background(withIdentifier: "kr.giftbot.example.backgroundConfig") // 백그라운드에서 사용할 수 있도록
    
    
    let sessionConfig = URLSessionConfiguration.default
    // 기본값은 true. Wi-Fi만 사용이 가능하도록
    sessionConfig.allowsCellularAccess = false
    // 기본값 4 -> 호스트당 최대몇개까지 사용하게 할것인가
    sessionConfig.httpMaximumConnectionsPerHost = 5
    // 기본값 60초 -> 요청시 최대 몇초까지 타임아웃을 설정 할 것인가
    sessionConfig.timeoutIntervalForRequest = 20
    // 기본값.useProtocolCachePolicy(원하는 캐시정책을 체택)
    sessionConfig.requestCachePolicy = .reloadIgnoringLocalCacheData // 로컬캐시데이터 무시하고
    // 기본값 false. 안정적으로 기다렸다가 연결할것인지 여부
    sessionConfig.waitsForConnectivity = true
    // 네트워크가 일시적으로 불안정할때 연결을 시도해보고 실패시 즉각 실패를 반환할것인지, 안정적으로 연결될때까지
    // 기다렸다가 반환할 것인지.. (즉각실패반환-false)
    
    // 기본캐시 URLCache.shared
    // 메모리 - 16KB (16 * 1024 = 16_384),
    // 디스크 - 256MB (256 * 1024 * 1024 = 268_435_456)
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    sessionConfig.urlCache = myCache // 내가지정한 캐시를 넣어주거나
    
    let cache = URLCache.shared // 기본쉐어드 캐시를 넣어주거나..
    sessionConfig.urlCache = cache
    
    print(cache.memoryCapacity) // 500 KB
    print(cache.diskCapacity) // 약 9.5MB
    
    print(cache.currentMemoryUsage) // 0 (현재사용중 캐시
    print(cache.currentDiskUsage) // 현재사용량
    
    // (user home directory)/Library/Caches/(application bundle id)/ -> 저장경로
    
    cache.removeAllCachedResponses() // 저장된 캐시를 삭제
    
    // let mySession = URLSession.shared.dataTask(with: <#T##URL#>)
    let mySession = URLSession(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    let task = mySession.dataTask(with: url) {
      [weak self] (data, reponse, error) in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self?.imageView.image = UIImage(data: data)!
        print("download completed")
      }
    }
    task.resume()
  }
  
  
  // MARK: - Get, Post, Delete
  
  // https://jsonplaceholder.typicode.com/
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    guard let url = URL(string: todoEndpoint) else { return }
    
    let task = URLSession.shared.dataTask(with: url) {
      (data, reponse, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      
      // 생략도가능..!
      guard let reponse = reponse as? HTTPURLResponse,
        (200..<300).contains(reponse.statusCode),
        // statusCode를 통해 상태 코드를 확인
        reponse.mimeType == "application/json" // 어떤형태로 들어오는 타입인지.. 생략해서도 가능
        else { return }
      // 여기까즤~
      
      guard let data = data else { return print("No Data") }
      
      guard let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        // 타입캐스팅을통해 data를 실제 값으로 변환
        let todoID = todo["id"] as? Int,
        let todoTitle = todo["title"] as? String
        else { return print("Could not get paresed data")}
      
      print("ID:", todoID)
      print("Title:", todoTitle)
    }
    task.resume()
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let todosURL = URL(string: todoEndpoint) else { return }
    
    let newToDo: [String: Any] = ["title": "My ToDo", "userID": "20"]
    guard let jsonToDo = try? JSONSerialization.data(withJSONObject: newToDo) else { return }
    
    var urlRequest = URLRequest(url: todosURL)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = jsonToDo
    
    let task = URLSession.shared.dataTask(with: urlRequest) {
      (data, reponse, error) in
      guard let data = data,
        let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      print(newItem)
      if let id = newItem["id"] as? Int {
        print(id)
      }
    }
    task.resume()
  }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      guard let data = data else { return print("No Data")}
      print("DELETE OK")
      
      if let res = response as? HTTPURLResponse {
        print(res.statusCode)
      }
      
      if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
        print(data)         // 2 bytes
        print(jsonObject)   // [:]
      }
    }
    task.resume()
  }
}

