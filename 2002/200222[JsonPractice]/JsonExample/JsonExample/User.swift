//
//  User.swift
//  JsonExample
//
//  Created by 은영김 on 2020/02/21.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import Foundation

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
""".data(using: .utf8)!

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
    
//    let surname = try container.decode(String.self, forKey: .surname)
//    let name = try container.decode(String.self, forKey: .name)
//    self.fullName = surname + name
//  let values = try decoder.container(keyedBy: CodingKeys.self)
//    self.fullName = try values.decode(String.self, forKey: .fullName)
    
    self.city = try container.decode(String.self, forKey: .city)
    self.fullName = try container.decode(String.self, forKey: .fullName)
    self.teamId = try container.decode(String.self, forKey: .teamId)
    self.nickname = try container.decode(String.self, forKey: .nickname)
    self.logo = try container.decode(String.self, forKey: .logo)
    self.shortName = try container.decode(String.self, forKey: .shortName)
    self.allStar = try container.decode(String.self, forKey: .allStar)
    self.nbaFranchise = try container.decode(String.self, forKey: .nbaFranchise)
    self.leagues = try container.decode(Leagues.self, forKey: .leagues)
    
//    let leaguesContainer = try container.nestedContainer(
//      keyedBy: leaguesKeys.self,
//      forKey: .leagues
//    )
//
//    self.leagues = try leaguesContainer.decode(Leagues.self, forKey: .standard)
    
    
//    let standardContainer = try container.nestedContainer(
//      keyedBy: standardKeys.self, forKey: )
    
    
  }
}

//do {
//  let user = try decoder.decode(User.self, from: jsonDataTest)
//print(user)
//
//} catch {
//  print(error)
//  }

