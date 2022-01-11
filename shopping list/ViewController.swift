//
//  ViewController.swift
//  shopping list
//
//  Created by Malachai Jacobs on 1/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    @IBOutlet weak var newItemTextfield: UINavigationItem!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        return cell
    }
    
    var items : [Item] = [ ]


    @IBAction func whenAddItemButtonPressed(_ sender: Any)
    {
        if let newItemName = newItemTextfield.text
        {
        let newItem = Item(name: newItemName)
        items.append(newItem)
        tableView.reloadData()
        }
        }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        
        let item1 = Item(name: "Milk")
        let item2 = Item(name: "Eggs")
        items = [item1, item2]
        tableView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

