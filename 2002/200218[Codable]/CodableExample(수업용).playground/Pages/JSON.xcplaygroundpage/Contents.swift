//: [Previous](@previous)
/*:
 # JSON
 */
import Foundation

struct MacBook: Codable {
  let model: String
  let modelYear: Int
  let display: Int
}

let macBook = MacBook(
  model: "MacBook Pro", modelYear: 2018, display: 15
)

// Codable 이전 - JSONSerialization
// Codable 이후 - JSONEncoder / JSONDecoder

/*:
 ---
 ## Encoder
 ---
 */
print("\n---------- [ Encoder ] ----------\n")
let jsonEncoder = JSONEncoder()
let encodedMacBook = try! jsonEncoder.encode(macBook)
print(encodedMacBook)

// JSON파일로 저장
let documentDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = documentDir
  .appendingPathComponent("macBookData")
  .appendingPathExtension("json")

do {
  try encodedMacBook.write(to: archiveURL)  // 경로를 지정해주면 파일로 저장이됨
} catch {
  print(error.localizedDescription)
}

/*:
 ---
 ## Decoder
 ---
 */
print("\n---------- [ Decoder ] ----------\n")
let jsonDecoder = JSONDecoder()
if let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}
// encodedMacBook을 맥북타입으로 변환을 하겠다.

// 파일에서 불러오기
if let retrievedData = try? Data(contentsOf: archiveURL), // 저장경로에서 데이터를 읽어옴
  let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)  // 53 bytes
  print(decodedMacBook) // retrievedData 디코딩하여 맥북타입으로 변환
}


/*
 Array
 */
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! jsonEncoder.encode(arr)
try? encodedArr.write(to: archiveURL) // 파일경로에 변환된 arr을 저장

if let decodedArr = try? jsonDecoder.decode([MacBook].self, from: encodedArr) {
  print(decodedArr)
}

if let retrievedData = try? Data(contentsOf: archiveURL), // 파일경로로 부터 가져와서 출력
  let decodedArr = try? jsonDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData) //163 bytes
  print(decodedArr) // 파일로 저장했다가 다시 가져옴
}


/*
 Dictionary
 */
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]
let encodedDict = try! jsonEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

if let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: encodedDict) {
  print(decodedDict) // 데이터변환
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: retrievedData) {
  print(retrievedData) // 파일저장
  print(decodedDict) // 파일불러들임
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
