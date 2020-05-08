//
//  ViewController.swift
//  iTunesMusicPlayer
//
//  Created by 은영김 on 2020/02/28.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import AVKit
import UIKit


class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
  
  private let searchController = UISearchController(searchResultsController: nil)
  private let scopeButtonTitles = ["Search", "Swift", "IU", "Twice"]
  
  private let api = API()
  private var songs: [Songs.Song] = []
  private var artworkRequests: [Int: URLSessionTask] = [:]
  private let player = AVPlayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // tableView.tableHeaderView = searchController.searchBar
    // 테이블뷰와 같이올라감 / 테이블뷰 헤더에 서치바 추가
    
    searchBarSetting()
    
  }
  
  func searchBarSetting() {
    navigationItem.searchController = searchController
    // 네비게이션 아이템에 서치컨트롤러를 추가
    
    // ios 13 미만
    definesPresentationContext = true
    // 서치부분만 강조되도록 처리하는 작업. 13부터는 자동으로 처리됨
    
    searchController.searchBar.tintColor = .orange
    // 기본은 blue~
    
    searchController.obscuresBackgroundDuringPresentation = true
    // 서치바 눌렀을때 아래부분이 블러처리 안되게~ (서치바 강조를 안해줌) 설정안해주면 true가 자동으로 적용
    searchController.searchBar.placeholder = "Search Songs"
    searchController.searchBar.delegate = self
    
    searchController.searchBar.showsCancelButton = false
    // cancelbutton없어짐 / 기본값 true
    searchController.searchBar.scopeButtonTitles = scopeButtonTitles
    
  }
  
  
}

// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
  
  func fetchSongs(term: String) {
    indicatorView.startAnimating()
    
    api.fetchSongs(term: term) { [weak self] result in
      switch result {
      case .success(let value):
        self?.songs = value.results
        self?.tableView.reloadData()
      case .failure(let error):
        print(error.localizedDescription)
      }
      self?.indicatorView.stopAnimating()
    }
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print(searchBar.text ?? "")
    guard let text = searchBar.text,
      var term = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
    term = term.trimmingCharacters(in: .whitespacesAndNewlines)
    // whitespacesAndNewlines 띄어쓰기나 공백제거
    fetchSongs(term: term)
  }
  
  // 스코프 눌렀을때
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//    print(selectedScope)
    if selectedScope != 0 {
      let term = scopeButtonTitles[selectedScope]
      fetchSongs(term: term)
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    songs.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let song = songs[indexPath.row]
    cell.textLabel?.text = song.trackName
    cell.detailTextLabel?.text = song.artistName
    
    let task = api.fetchArtwork(url: song.artworkUrl100) { result in
      cell.imageView?.image = UIImage(data: try! result.get())
      self.artworkRequests[indexPath.row] = nil
    }
    
    artworkRequests[indexPath.row] = task
    
    return cell
  }
  
  
  
}


extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    artworkRequests[indexPath.row]?.cancel()
    artworkRequests[indexPath.row] = nil
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let song = songs[indexPath.row]
    guard let url = URL(string: song.previewUrl) else { return }
    player.pause()
    
    let item = AVPlayerItem(url: url)
    player.replaceCurrentItem(with: item)
    player.play()
  }
}
/*
 
 [ 필요 속성 ]
 let artistName: String
 let trackName: String
 let artworkUrl100: String
 let previewUrl: String
 [ API ]
 "https://itunes.apple.com/search?"
 media=music
 entity=song
 country=국가   // KR, US, JP 등
 term=제목 또는 가수  // e.g. Maroon 5
 [ 라이브러리 ]
 Alamofire
 
 */
