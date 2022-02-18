//
//  NewViewController.swift
//  shopping list
//
//  Created by Malachai Jacobs on 2/11/22.
//

import UIKit

class NewViewController: UIViewController
{
    var labelOne = ""
    var number = 0
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var numberOfItem: UILabel!
    var item : Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfItem.text = "\(number)"
        quantityLabel.text = labelOne

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
