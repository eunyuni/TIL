import UIKit

print("\n-------- [Set] --------\n")

var array1 = [4,6,7,32,35,76,78,8,4,3,4,6,6,3,2,2,5,6,65]

//let set1 = Set(array1)
//print(array1)
//print(set1)
//array1 = Array(set1)

array1 = Array(Set(array1))
array1.sorted()


print("\n-------- [ 튜플 ] --------\n")
/*******************************
 값이 정해지면 추가, 수정, 삭제 불가
 */
let tempValue: (String, Character, Int, Float, Bool) = ("뇽뇽이", "ㅇ", 123, 12.4, true)
let (a,b,c,d,e) = tempValue
a; b; c + 123; d + 0.555; e

func getTupleValue() -> (String, String, Int) {
  return ("v", "ddd", 100)
}
var (aa,bb,cc) = getTupleValue()
aa.append("e")



print("\n-------- [Dictionary] --------\n")

var tpl04 : (String) = ("babo")


var newCapital = [String: String]()
newCapital["JP"] = "Tokyo"

newCapital.isEmpty ? "비어있다" : "크기는\(newCapital.count) \(newCapital)이다"

// updateValue-> 값을 수정시 이전의 값이 결과값으로 반환/새롭게 추가도 가능
newCapital.updateValue("Selou", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
let tokyo = newCapital.updateValue("Sapporo", forKey: "JP")
print(tokyo ?? "")

newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")
newCapital["CA"] = nil
print()
let removeValue = newCapital.removeValue(forKey: "CN")

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
