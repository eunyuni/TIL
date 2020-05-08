//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/*
 Basic
 */
print("\n---------- [ Basic ] ----------")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization
if let json = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
  let name = json["name"] as? String,
  let age = json["age"] as? Int
{
  let tory = Dog(name: name, age: age)
  print("JSONSerialization:", tory)
}

print("\n---------- [ Basic: JSONDecoder ] ----------\n")
// JSONDecoder
 let jsonDecoder = JSONDecoder()

if let decodeDog = try? jsonDecoder.decode(Dog.self, from: jsonData) {
  print("JSONDecoder:", decodeDog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "nana", "age": 5 },
  ]
  """.data(using: .utf8)!

print("\n---------- [ Array: JSONSerialization ] ----------\n")
// JSONSerialization
if let json = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]]
{
  json.compactMap {
    guard let name = $0["name"] as? String,
      let age = $0["age"] as? Int else { return }
    print(Dog(name: name, age: age))
  }
}


print("\n---------- [ Array: JSONDecoder ] ----------\n")
// JSONDecoder

if let jsonArr = try? jsonDecoder.decode([Dog].self, from: jsonArrData) {
  print(jsonArr)
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "nana", "age": 7 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization
print("\n---------- [ Dictionary: JSONSerialization ] ----------\n")
if let json = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: [Any]]  {
  if let data = json["data"] as? [[String: Any]] {
//    print(data)
    data.compactMap {
      if let name = $0["name"] as? String,
        let age = $0["age"] as? Int {
        print(Dog(name: name, age: age))
      }
    }
  }
}

//  json.compactMap {
//    guard let name = $0["name"] as? String,
//      let age = $0["age"] as? Int else { return }




print("\n---------- [ Dictionary: JSONDecoder ] ----------\n")
// JSONDecoder







/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}
//let ddd = Dog(from: <#T##[String : Any]#>)
/*
 Basic
 */
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/*
 Array
 */
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {
  
  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
