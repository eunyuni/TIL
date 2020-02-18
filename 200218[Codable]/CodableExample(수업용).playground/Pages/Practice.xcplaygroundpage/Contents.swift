//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/*
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 */
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
  "name": "Orange",
  "cost": 100,
  "description": "A juicy orange"
},
{
  "name": "Apple",
  "cost": 200
},
{
  "name": "Watermelon",
  "cost": 300
},
]
""".data(using: .utf8)!


struct Fruit: Decodable {
  let name: String
  let cost: Int
  let description: String?
}

if let fruit = try? decoder.decode([Fruit].self, from: jsonFruits) {
  print(fruit)
}


/*
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 */
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
  let name: String
  let reportId: String
  let readCount: String
  let reportDate: String
  
  private enum CodingKeys: String, CodingKey {
    case name
    case reportId = "report_id"
    case readCount = "read_count"
    case reportDate = "report_date"
  }
}

do {
  let report = try decoder.decode(Report.self, from: jsonReport)
  print(report)
} catch {
  print(error.localizedDescription)
}


/*
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 */

print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      { "title": "Gran Torino", "release_year": 2008 },
      { "title": "3 Idiots", "release_year": 2009 },
      { "title": "Big Fish", "release_year": 2003 },
    ]
  }
]
""".data(using: .utf8)!



struct Person: Decodable {
  let name: String
  let favoriteMovies: [Movie]
  
  private enum CodingKeys: String, CodingKey {
    case name
    case favoriteMovies = "favorite_movies"
  }
  
  init(from decoder: Decoder) throws {
  let values = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try values.decode(String.self, forKey: .name)
    self.favoriteMovies = try values.decode([Movie].self, forKey: .favoriteMovies)
  }
}

struct Movie: Decodable {
  let title: String
  let release: Int
  
  private enum CodingKeys12: String, CodingKey {
    case title
    case release = "release_year"
  }
  
  init(from decoder: Decoder) throws {
  let values = try decoder.container(keyedBy: CodingKeys12.self)
    self.title = try values.decode(String.self, forKey: .title)
    self.release = try values.decode(Int.self, forKey: .release)
  }
}




do {
  let person = try decoder.decode([Person].self, from: jsonMovie)
//  print(person)
  print(person[0].name)
  person[0].favoriteMovies.forEach{
    print($0)
  }
//  person.favoriteMovies.forEach{ print($0) }
} catch {
  print(error)
}



/*
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 let fullName: String
 let description: String?
 let starCount: Int
 let forkCount: Int
 let url: String
 
 */

struct Repositories {
}


func fetchGitHubRepositories() {
//  let urlString = "https://api.github.com/search/repositories?q=user:giftbott"
//  let url = URL(string: urlString)!

}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
