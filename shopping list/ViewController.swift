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
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBAction func detailTextLabel(_ sender: Any)
    {
    }
    
    @IBOutlet weak var textField: UITextField!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = "Quantity: \(currentItem.quantity)"
        return cell
    }
    
    var items : [Item] = [ ]


    @IBAction func whenAddItemButtonPressed(_ sender: Any)
    {
        var newItemQuantityString = quantityTextField.text ?? ""
        
        var newItemQuantityInt = Int(newItemQuantityString)
    
        if let newItemName = textField.text
        {
            if let newItemQuantity = newItemQuantityInt
            {
            
        let newItem = Item(name: newItemName, quantity: newItemQuantity)
        items.append(newItem)
        tableView.reloadData()
            }
        }
        }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        
        let item1 = Item(name: "Milk" , quantity: 2)
        let item2 = Item(name: "Eggs", quantity: 17)
        items = [item1, item2]
        tableView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! NewViewController
    if let indexPath = tableView.indexPathForSelectedRow {
    let item = items[indexPath.row]
    let vc = segue.destination as! NewViewController
    vc.item = item
        if segue.identifier == "SegueOne"
        {
            nextViewController.labelOne = item.name
            print(item.name)
            nextViewController.number = item.quantity
        }
        
}

    }
    
}
