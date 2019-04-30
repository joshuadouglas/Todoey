//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Josh Douglas on 27/4/19.
//  Copyright © 2019 Josh Douglas. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    // Global Variables
    var categories: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadData()
        
    }
    
    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel!.text = categories?[indexPath.row].name ?? "No categories..."
        
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexRow = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexRow.row]
        }
    }
    
    
    
    //MARK: - Add Category Alert Controller
    @IBAction func addCategoryTapped(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        })
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter category name.."
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    
    //MARK: - Data Model Manipulation Methods
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadData() {
        
        categories = realm.objects(Category.self)

        tableView.reloadData()
    }
    
}
