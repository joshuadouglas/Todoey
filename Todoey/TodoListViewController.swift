//
//  ViewController.swift
//  Todoey
//
//  Created by Josh Douglas on 22/4/19.
//  Copyright © 2019 Josh Douglas. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var itemsArray = [Todo]()
    var selectedCategory : Category? {
        didSet {
//            loadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - TableView Controller DataSource Methods
    // - - - - - - - - - - - - - - - - - - - - - - - -
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isChecked ? .checkmark : .none
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    
    
    
    //MARK: - TableView Delegate Methods
    // - - - - - - - - - - - - - - - - -
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        itemsArray[indexPath.row].isChecked = !itemsArray[indexPath.row].isChecked
//        self.saveData()
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    
//    @IBAction func addTodoButtonTapped(_ sender: UIBarButtonItem) {
//        var textField = UITextField()
//
//        let alert = UIAlertController(title: "Add Item", message: "Add your next item below.", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//
//            let newTodo = Todo(context: self.context)
//            newTodo.title = textField.text!
//            newTodo.isChecked = false
//            newTodo.parentCategory = self.selectedCategory
//
//            self.itemsArray.append(newTodo)
//            self.saveData()
//        }
//
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Add new Todo Item.."
//            textField = alertTextField
//        }
//
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    
    
    
    
    // MARK: - Model Manipulation Methods
    // - - - - - - - - - - - - - - - - -
//    func saveData() {
//
//        do {
//            try context.save()
//        } catch {
//            print("Error: \(error)")
//        }
//
//        self.tableView.reloadData()
//    }
    
//    func loadData(with request: NSFetchRequest<Todo> = Todo.fetchRequest(), predicate: NSPredicate? = nil) {
//
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemsArray = try context.fetch(request)
//        } catch {
//            print("Error: \(error)")
//        }
//
//        tableView.reloadData()
//    }

}



//MARK: - Search Bar Delegate Methods
//extension TodoListViewController : UISearchBarDelegate {
//
//    //  -- Query items by title containing search parameters --
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        let request : NSFetchRequest<Todo> = Todo.fetchRequest()
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//        loadData(with: request, predicate: predicate)
//    }
//
//
////  -- Clear search query parameters and resign status --
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text!.count == 0 {
//            loadData()
//
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}

