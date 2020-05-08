//: [Previous](@previous)
import Foundation

let jsonData = """
{
  "user_name": "James",
  "user_email": "abc@xyz.com",
  "gender": "male",
}
""".data(using: .utf8)!


struct User: Decodable {
  let name: String
  let email: String
  let gender: String
  
  // CodingKeys를 통해서 이름을 맞춰줌
  // 이과정이 없으면 이름이 다를때 변환이 안되고 에러남
  private enum CodingKeys: String, CodingKey {
    case name = "user_name"
    case email = "user_email"
    case gender
  }
}


let decoder = JSONDecoder()
do {
let user = try decoder.decode(User.self, from: jsonData)
print(user)
} catch {
  print(error.localizedDescription)
}

//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
