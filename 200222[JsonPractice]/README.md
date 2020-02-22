# Json 연습하기

* jsonData를 꺼내기!

```swift
let jsonData = """
{
    "city": "Atlanta",
    "fullName": "Atlanta Hawks",
    "teamId": "1",
    "nickname": "Hawks",
    "logo": "https://upload.wikimedia.org/wikipedia/fr/e/ee/Hawks_2016.png",
    "shortName": "ATL",
    "allStar": "0",
    "nbaFranchise": "1",
    "leagues": {
        "standard": {
            "confName": "East",
            "divName": "Southeast"
        }
    }
}
"""
```



## 1단계

```swift
let decoder = JSONDecoder()

// MARK: Struct

struct Leagues: Decodable {
  let standard: Standard
}

struct Standard: Decodable {
  let confName: String
  let divName: String
}

struct User: Decodable {
  let city: String
  let fullName: String
  let teamId: String
  let nickname: String
  let logo: String
  let shortName: String
  let allStar: String
  let nbaFranchise: String
  let leagues: Leagues
  
  private enum CodingKeys: String, CodingKey {
    case city, fullName, teamId, nickname, logo, shortName, allStar, nbaFranchise, leagues
  }
  
  private enum leaguesKeys: String, CodingKey {
    case standard
  }
  
  private enum standardKeys: String, CodingKey {
  case confName, divName
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.city = try container.decode(String.self, forKey: .city)
    self.fullName = try container.decode(String.self, forKey: .fullName)
    self.teamId = try container.decode(String.self, forKey: .teamId)
    self.nickname = try container.decode(String.self, forKey: .nickname)
    self.logo = try container.decode(String.self, forKey: .logo)
    self.shortName = try container.decode(String.self, forKey: .shortName)
    self.allStar = try container.decode(String.self, forKey: .allStar)
    self.nbaFranchise = try container.decode(String.self, forKey: .nbaFranchise)
    self.leagues = try container.decode(Leagues.self, forKey: .leagues)  
  }
}

func user() {
    // 덜꺼냈음 ㅎ
    let decoder = JSONDecoder()
    do {
    let user = try decoder.decode(User.self, from: jsonData)
    print(user)
    print(user.leagues.standard.confName)
    dump(user)
      
      
  }catch {
    print(error)
    print(error.localizedDescription)
  }
}
```

![user](https://tva1.sinaimg.cn/large/0082zybpgy1gc58xzr454j31ly0outel.jpg)



## 2단계

```swift
let jsonDataTest = """
{
    "city": "Atlanta",
    "fullName": "Atlanta Hawks",
    "teamId": "1",
    "nickname": "Hawks",
    "logo": "https://upload.wikimedia.org/wikipedia/fr/e/ee/Hawks_2016.png",
    "shortName": "ATL",
    "allStar": "0",
    "nbaFranchise": "1",
    "leagues": {
        "standard": {
            "confName": "East",
            "divName": "Southeast"
        }
    }
}
""".data(using: .utf8)!

let decoderTest = JSONDecoder()

// MARK: Struct

struct Test: Decodable {
  let city: String
  let fullName: String
  let teamId: String
  let nickname: String
  let logo: String
  let shortName: String
  let allStar: String
  let nbaFranchise: String
  let confName: String
  let divName: String
  
  private enum CodingKeys: String, CodingKey {
    case city, fullName, teamId, nickname, logo, shortName, allStar, nbaFranchise, leagues
  }
  
  private enum LeaguesKey: String, CodingKey {
    case standard
  }
  
  private enum StandardKeys: String, CodingKey {
  case confName, divName
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.city = try container.decode(String.self, forKey: .city)
    self.fullName = try container.decode(String.self, forKey: .fullName)
    self.teamId = try container.decode(String.self, forKey: .teamId)
    self.nickname = try container.decode(String.self, forKey: .nickname)
    self.logo = try container.decode(String.self, forKey: .logo)
    self.shortName = try container.decode(String.self, forKey: .shortName)
    self.allStar = try container.decode(String.self, forKey: .allStar)
    self.nbaFranchise = try container.decode(String.self, forKey: .nbaFranchise)
    
    let leaguesContainer = try container.nestedContainer(
      keyedBy: LeaguesKey.self,
      forKey: .leagues
    )
    
    let standardContainer = try leaguesContainer.nestedContainer(
      keyedBy: StandardKeys.self,
      forKey: .standard
    )

    self.confName = try standardContainer.decode(String.self, forKey: .confName)
    self.divName = try standardContainer.decode(String.self, forKey: .divName)

  }
}

func test() {
  // 좀더 꺼냇음
  let decoder = JSONDecoder()
  
  do {
    let test = try decoder.decode(Test.self, from: jsonDataTest)
    print(test)
    print("test.nickname:" ,test.nickname)
    dump(test)
  } catch {
    print(error.localizedDescription)
  }
}
```

![test](https://tva1.sinaimg.cn/large/0082zybpgy1gc592md06sj31lq0k40xl.jpg)