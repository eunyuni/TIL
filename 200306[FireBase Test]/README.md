# FireBase Table Test

```swift
import UIKit
import Firebase

class ViewController: UIViewController {
  
  var ref: DatabaseReference!
  
  @IBOutlet weak var tableView: UITableView!
  var todos = [String]()
  
  
  @IBAction func addTodo(_ sender: Any) {
    let dialog = UIAlertController(title: "할일을 추가해용!", message: nil, preferredStyle: .alert)
    dialog.addTextField()
    let okAction = UIAlertAction(title: "OK", style: .default) { (action : UIAlertAction) in
      if let newTodo = dialog.textFields?[0].text {
        print("입력할 할일 : \(newTodo)")
        self.todos.append(newTodo)
        self.tableView.reloadData()
        
        self.ref = Database.database().reference()
        let itemRef = self.ref.child("list")
        itemRef.setValue(self.todos)
      }
      
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    dialog.addAction(okAction)
    dialog.addAction(cancelAction)
    self.show(dialog, sender: nil)
  }
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
    cell.textLabel?.text = self.todos[indexPath.row]
    return cell
  }
}

```
