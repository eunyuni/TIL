//: [Previous](@previous)

import UIKit

print("\n-------- [Enum] --------\n")
/**********************************
 Enum: 문자열, 정수값 등 직접입력받아야 할 정보들을
        선택할수있도록 만듬으로써 범위를 제한.
        무작위로 값이 입력됨을 방지하여 코드의 안정성을 높여줌.
        오류를 줄일 수 있음
 Extension: 기존객체를 직접수정하지 않고도 기능을 추가. 기능 확장.
 */

enum HTTPCode: Int {
  case OK = 200
  case NOT_MODIFY = 304
  case INCORRECT_PAGE = 404
  case SERVER_ERROR = 500
  
  var value: String {
    return "HTTPCode number is \(self.rawValue)"
  }
  
  func getDescription() -> String {
    switch self {
    case .OK:
      return "응답성공. HTTPCode is \(self.rawValue)"
    case .NOT_MODIFY:
      return "변경내용없음. HTTPCode is \(self.rawValue)"
    case .INCORRECT_PAGE:
      return "존재하지 않는 페이지. HTTPCode is \(self.rawValue)"
    case .SERVER_ERROR:
      return "서버오류. HTTPCode is \(self.rawValue)"
    }
  }
  static func getName() -> String {
    return "This is Enumeration is HTTPCode"
  }
}

enum ImageFormat {
  case JPEG
  case PNG(Bool)
  case GIF(Int, Bool)
}
var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)

var response = HTTPCode.OK
response = .NOT_MODIFY

response.value
response.getDescription()

HTTPCode.getName()

let alert = UIAlertController(title: "알림", message: "액션시트창입니다.", preferredStyle: .actionSheet)


print("\n-------- [Extensions] --------\n")


extension Double {
  var km: Double { return self * 1000.0 }
  var m: Double { return self }
  var cm: Double { return self / 100.0 }
  var mm: Double { return self / 1000.0 }
  var description: String {
    return "음..이거다그래"
  }
}

2.km
5.5.cm
125.mm
7.0.description

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m입니다.")
distance.mm

extension Int {
  func repeatRun(task: () -> Void) {
    for _ in 0..<self {
      task()
    }
  }
  
  mutating func square() {
    self = self * self
//    return self
  }
}

let d = 3
d.repeatRun {
  print("나오시게!")
}
5.repeatRun {
  print("유후후후후")
}

var value = 3
//var value09 = value.square()


//: [Next](@next)
