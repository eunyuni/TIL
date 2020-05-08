//: [Previous](@previous)
/*:
 # PropertyList
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

// Codable 이전 - PropertyListSerialization
// Codable 이후 - PropertyListEncoder / PropertyListDecoder

/*:
 ---
 ## Encoder
 ---
 */
print("\n---------- [ Encoder ] ----------\n")
let pListEncoder = PropertyListEncoder() // PropertyListEncoder 타입으로 지정
let encodedMacBook = try! pListEncoder.encode(macBook)
print(encodedMacBook)

let documentDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = documentDir
  .appendingPathComponent("macBookData") // 파일이름
  .appendingPathExtension("plist") // 파일확장자

try? encodedMacBook.write(to: archiveURL) // 파일경로 저장


/*:
 ---
 ## Decoder
 ---
 */
print("\n---------- [ Decoder ] ----------\n")
let pListDecoder = PropertyListDecoder()
if let decodedMacBook = try? pListDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedMacBook = try? pListDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)
  print(decodedMacBook)
}



/*:
 ---
 ### Question
 - MacBook 타입을 Array, Dictionary 형태로 Encoding / Decoding 하려면?
 ---
 */
//Array
print("\n---------- [ Array ] ----------\n")
let arr1 = [macBook, macBook, macBook]
let propertyList = PropertyListEncoder()
let propertyListDe = PropertyListDecoder()
let encodedArr1 = try! propertyList.encode(arr1)
try? encodedArr1.write(to: archiveURL)

if let decodedArr1 = try? propertyListDe.decode([MacBook].self, from: encodedArr1) {
  print(decodedArr1)
}

// Dictionary
print("\n---------- [ Dictionary ] ----------\n")
let dict1 = ["mac": macBook, "mac1": macBook, "mac2": macBook]

let encodedDict1 = try! propertyList.encode(dict1)
try? encodedDict1.write(to: archiveURL)

if let decodedDict1 = try? propertyListDe.decode([String: MacBook].self, from: encodedArr1) {
  print(decodedDict1)
}


/*:
 ---
 ### Answer
 ---
 */
// Array
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! pListEncoder.encode(arr)
try? encodedArr.write(to: archiveURL)

if let decodedArr = try? pListDecoder.decode([MacBook].self, from: encodedArr) {
  print(decodedArr)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedArr = try? pListDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedArr)
}



// Dictionary
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]

let encodedDict = try! pListEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

if let decodedDict = try? pListDecoder.decode([String: MacBook].self, from: encodedDict) {
  print(decodedDict)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedDict = try? pListDecoder.decode([String: MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedDict)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
