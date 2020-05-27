import UIKit

// 집단자료형

var tpl04 : (String) = ("babo")


var newCapital = [String: String]()
newCapital["JP"] = "Tokyo"

newCapital.isEmpty ? "비어있다" : "크기는\(newCapital.count)이다"

// updateValue-> 값을 수정시 이전의 값이 결과값으로 반환/새롭게 추가도 가능
newCapital.updateValue("Selou", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
let tokyo = newCapital.updateValue("Sapporo", forKey: "JP")
print(tokyo ?? "")
newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")
newCapital["CA"] = nil
print()

if let removeValue = newCapital.removeValue(forKey: "CN") {
  print("삭제된 값은 \(removeValue)입니당")
} else {
  print("아무것도 삭제되지 않았슴다")
}
print()

newCapital.count
for i in newCapital {
  let (key, value) = i
  print("현재 데이터는 \(key) : \(value) 입니당")
}
print()

for (a, b) in newCapital {
  print("현재 데이터는 \(a) : \(b) 입니당")
}


//: [Next](@next)
