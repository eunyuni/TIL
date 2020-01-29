//
//  CategoryTableViewController.swift
//  DominoUpdate
//
//  Created by 은영김 on 2020/01/29.
//  Copyright © 2020 eunyuni. All rights reserved.
//

import UIKit

// 델리게이트 자동연결
class CategoryTableViewController: UITableViewController {
  
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let imageView = UIImageView()
    imageView.image = UIImage(named: "logo")
    imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 200))
    // 비율을 유지하면서 최소한으로 꽉차게
    imageView.contentMode = .scaleAspectFit
    tableView.tableHeaderView = imageView
    
    tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)

    navigationSet()
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  private func navigationSet() {
    navigationItem.title = "Domino's"
  }
  
  
  // MARK: - Table view data source
  
//  override func numberOfSections(in tableView: UITableView) -> Int {
//    // #warning Incomplete implementation, return the number of sections
//    return 0
//  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    menuData.count
  }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell else { return UITableViewCell() }
    cell.configure(categoty: menuData[indexPath.row].category)
   
   return cell
   }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100
  }
  
  //
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let menu = menuData[indexPath.row] // 각하나만의 메뉴가 들어감
    let productVC = ProductTableViewController(menu: menu) // 누르게된 해당메뉴를 넣어줌
    navigationController?.pushViewController(productVC, animated: true)
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
