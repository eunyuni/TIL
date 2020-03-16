//
//  Songs.swift
//  iTunesMusicPlayer
//
//  Created by 은영김 on 2020/02/28.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import Foundation

struct Songs: Decodable {
  let resultCount: Int
  let results: [Song]
  
  struct Song: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let previewUrl: String
  }
}
