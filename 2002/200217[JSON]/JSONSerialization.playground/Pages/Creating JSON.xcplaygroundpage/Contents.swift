//: [Previous](@previous)
import Foundation
//: - - -
//: # Creating JSON Data
//: * class func isValidJSONObject(_:) -> Bool
//: * class func writeJSONObject(_:to:options:error:) -> Int
//: * class func data(withJSONObject:options:) throws -> Data
//: - - -

//: ---
//: ## Write JSON Object to OutputStream
//: ---
// Foundation 객체 -> 파일 저장

func writeJSONObjectToOutputStream() {
  let jsonObject = ["hello": "world", "foo": "bar", "iOS": "Swift"]
  // 파일로저장
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
  
  let jsonFilePath = "myJsonFile.json" // 데이터를 저장할 파일패스를 만들어주고
  let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
  //파일을 열고 하나하나 집어넣고 닫아주는 형태 -> OutputStream / append -> 추가할건지 여부
  outputJSON.open() // 파일패스를 열어주는
  

  let writtenBytes = JSONSerialization.writeJSONObject(
    jsonObject,
    to: outputJSON,
    options: [],
//    options: [.prettyPrinted], // 보기좋은 형태로 데이터를 저장, byte도 늘어남
//    options: [.prettyPrinted, .sortedKeys], // 유니코드 순서로 정렬
    error: nil
  )
  print("writtenBytes: ",writtenBytes)  // 0 = error, 데이터가 없어서 0이면 에러, 저장이 제대로 되지않음을뜻함
  outputJSON.close()
  
  do {
    let jsonString = try String(contentsOfFile: jsonFilePath)
    // 파일로부터 컨텐츠를 읽어와서 스트링으로 나타내줌
    print(jsonString)
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ writeJSONObjectToOutputStream ] ----------\n")
writeJSONObjectToOutputStream()

//: ---
//: ## Data with JSON Object
//: ---
// Foundation 객체 -> JSON 형식 데이터로 변환

private func dataWithJSONObject() {
  let jsonObject: [String: Any] = [
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3],
    "someDict"   : [
      "someBool" : true
    ]
  ]
  
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
  do {
    // 딕셔너리를 데이터로 인코딩했다가 다시 데이터를 통해 딕셔너리로 변환해보는 과정
    let encoded = try JSONSerialization.data(withJSONObject: jsonObject)
    // 데이터를 인코딩변환
    let decoded = try JSONSerialization.jsonObject(with: encoded)
    // 다시 jsonobject로 변환 (스위프트에서 사용이가능하게 변환, any로 들어오기때문에 타입캐스팅 필요)
    // 데이터를 jsonobject를 이용해 파운데이션 객체로 변환
    if let jsonDict = decoded as? [String: Any] { // 원하는 형태로 타입캐스팅
      print(jsonDict)
      //jsonObject를 데이터로 변환후 다시 jsonObject로 변환하여 프린트찍은 내용
    }
  } catch {
    print(error.localizedDescription)
  }
}

print("\n---------- [ dataWithJSONObject ] ----------\n")
dataWithJSONObject()
 


//: - - -
//: # Creating a JSON Object
//: * class func jsonObject(with:options:) throws -> Any
//: - - -

//: ---
//: ## JSON Object with Data
//: ---
// JSON 형식 데이터 -> Foundation 객체

private func jsonObjectWithData() {
  let jsonString =  """
  {
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3, 4],
    "someDict"   : {
      "someBool" : true
    }
  }
  """
//  let jsonString = """
//     { "hello": "world", "foo": "bar", "iOS": "Swift" }
//  """
  let jsonData = jsonString.data(using: .utf8)!
// 문자열을 데이터로 저장한 뒤 제이슨 오브젝트로 변환해서 실제 우리가 사용하는 데이터로 변환하는 연습
// 백앤드에서 api가 완성되어 실제로사용할때 만들어둔 데이터와 같다면 그대로 사용
  do {
    let foundationObject = try JSONSerialization.jsonObject(with: jsonData)
    if let jsonDict = foundationObject as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ jsonObjectWithData ] ----------\n")
//jsonObjectWithData()



//: ---
//: ## JSON Object with InputStream
//: ---

// 파일을 저장한 후 읽어옴
private func jsonObjectWithInputStream() {
  let jsonFilePath = "myJsonFile.json"
  let inputStream = InputStream(fileAtPath: jsonFilePath)!
  inputStream.open()
  defer { inputStream.close() }
  
  guard inputStream.hasBytesAvailable else { return }
  // 해당파일에 데이터가 있는지 체크 -> .hasBytesAvailable
  
  do {
    let jsonObject = try JSONSerialization.jsonObject(with: inputStream)
    print(jsonObject)
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ jsonObjectWithInputStream ] ----------\n")
//jsonObjectWithInputStream()


//: [Next](@next)
