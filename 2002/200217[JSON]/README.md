

## 과제

```swift
import Foundation


/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

let spaceStation = "http://api.open-notify.org/iss-now.json"
let spaceURL = URL(string: spaceStation)!

func practice1() {
  let dataTask = URLSession.shared.dataTask(with: spaceURL) {
    (data, response, error) in
    guard error == nil else { return print(error!, "발생 위험위험~~!!") }
    guard let data = data else { return }
    
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
    print("jsonObject: ", jsonObject)
    
    guard (jsonObject["message"] as? String) == "success",
      let position = jsonObject["iss_position"] as? [String: String],
      let timestamp = jsonObject["timestamp"] as? Int
      else { return print("Parsing Error")}
   
    print("\n====국제정거장 위치정보====\n")
    print("접수 번호: \(timestamp) ")
    print(position)
//    print(latitude)
  }
  dataTask.resume()
}
practice1()


/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */


let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
""".data(using: .utf8)!

struct User {
  let id: Int
  let first_name: String
  let last_name: String
  let email: String
}

func practice2() {
  guard let json = try? JSONSerialization.jsonObject(with: jsonString2) as? [String: Any] else { return }
  guard let user = json["users"] as? [[String: Any]] else { return }
//  print(user)
  user.compactMap {
    guard let id = $0["id"] as? Int,
    let firstname = $0["first_name"] as? String,
    let lastname = $0["last_name"] as? String,
      let email = $0["email"] as? String else { return nil}
    return User(id: id, first_name: firstname, last_name: lastname, email: email)
  }
  .forEach{ print($0)}
}
practice2()



/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

let posts = "https://jsonplaceholder.typicode.com/posts"
let postsURL = URL(string: posts)!

func practice3() {
  let dataTask = URLSession.shared.dataTask(with: postsURL) {
    (data, response, error) in
    guard let data = data else { return }
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { return print("data error")}
//    print(jsonObject)
//    jsonObject.compactMap {
//      guard let userId = $0["userId"] as? Int,
//        let id = $0["id"] as? Int,
//      let title = $0["title"] as? String,
//        let body = $0["body"] as? String else {return print("Nope~~")}
//      return Post(userId: userId, id: id, title: title, body: body)
//    }
//    .forEach{print($0)}
    print("Post개수:",jsonObject.count)
  }
  dataTask.resume()
}
practice3()

```

