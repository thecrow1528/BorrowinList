//
//  CustomViewController.swift
//  Borrowing List
//
//  Created by Mirza Durakovic on 16/11/2017.
//  Copyright © 2017 Mirza Durakovic. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARRK @IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    //MARK: ViewController func
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyItems.shared.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = MyItems.shared.items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell{
            
            cell.set(name: item.name, borrowed: item.borrowedTo, value: item.value, serial: item.serial,when: item.dateOfReturn)
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        MyItems.shared.items.remove(at: indexPath.row)
       tableView.deleteRows(at: [indexPath], with: .fade)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
//      Testing...
//        let item1 = Item(name: "Mobitel", value: "345.76", serial: "kgdfhgfkj", borrowedTo: "Pepa",dateOfReturn: "19.11.2017")
//        let item2 = Item(name: "MacBook", value: "2340.00", serial: "kKJhgfkj", borrowedTo: "Dino", dateOfReturn: "20.11.2017")
//        let item3 = Item(name: "Punjac", value: "45.76", serial: "PUNJAC87", borrowedTo: "Darko",dateOfReturn: "31.12.2017")
//        MyItems.shared.items.append(item1)
//        MyItems.shared.items.append(item2)
//        MyItems.shared.items.append(item3)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
