//
//  Test.swift
//  JsonExample
//
//  Created by 은영김 on 2020/02/21.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import Foundation

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
