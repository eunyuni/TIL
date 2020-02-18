//: # Nested Codable
import Foundation

let jsonData = """
{
  "message": "success",
  "number": 3,
  "people": [
    { "craft": "ISS", "name": "Anton Shkaplerov" },
    { "craft": "ISS", "name": "Scott Tingle" },
    { "craft": "ISS", "name": "Norishige Kanai" },
  ]
}
""".data(using: .utf8)!


struct Astronauts: Decodable {
  let message: String
  let number: Int
  let people: [Person]
  
  // 필요한것만 읽어오기위해 carft는 생략해줬음
  // Person은 밖으로 빼줘도됌
  struct Person: Decodable {
    let name: String
  }
}

do {
  let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
  //Astronauts타입으로 바로변환
  print(astronauts.message)
  print(astronauts.number)
  astronauts.people.forEach { print($0)}
} catch {
  print(error.localizedDescription)
}



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
