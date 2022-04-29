
//  ViewController.swift
//  shopping list
//
//  Created by Malachai Jacobs on 1/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    var items : [Item] = [ ]
    var itemNames:[String] = [ ]
    var itemQuantity:[Int] = [ ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    //save button
    @IBAction func saveButton(_ sender: Any)
    {
        let defaults = UserDefaults.standard
        defaults.set(itemNames, forKey: "ArrayOfItemNames")
        defaults.set(itemQuantity, forKey: "ArrayOfItemQuantities")
       // print(defaults)
       
    }
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
                
                print(newItemName)
                itemNames.append(newItemName)
                itemQuantity.append(newItemQuantity)
            }
        }
        }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let defaults = UserDefaults.standard
        if let itemName = defaults.array(forKey: "ArrayOfItemNames"),let itemQuantities = defaults.array(forKey: "ArrayOfItemQuantities")  {
             itemNames = itemName as! [String]
            itemQuantity = itemQuantities as! [Int]
           
        }
//        let item1 = Item(name: "Milk" , quantity: 2)
//        let item2 = Item(name: "Eggs", quantity: 17)
//        items = [item1, item2]
        
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
           
            nextViewController.number = item.quantity
        }
        
}

    }
}
