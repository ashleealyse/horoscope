//
//  SettingsTableTableViewController.swift
//  Zodiacs
//
//  Created by Ashlee Krammer on 12/11/17.
//  Copyright © 2017 Ashlee Krammer. All rights reserved.
//

import UIKit

class SettingsTableTableViewController: UITableViewController {
    
    //Outlets
    @IBOutlet weak var nameCell: UITableViewCell!
    @IBOutlet weak var birthdayCell: UITableViewCell!
    
    
    
    
    
    
    //Variables
    
    var nameKey = "nameKey"
    var birthdayKey = "birthdayKey"
    var defaults = UserDefaults.standard
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = self.defaults.value(forKey: self.nameKey) as? String {
            self.nameCell.textLabel?.text = name
        }
        
        
        if let birthday = self.defaults.value(forKey: self.birthdayKey) as? String {
            self.birthdayCell.textLabel?.text = birthday
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.indexPathForSelectedRow?.section == 0{
            let alert = UIAlertController(title: "Please Enter Your Name ", message: "", preferredStyle: .alert)
            
            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.text = ""
            }
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                //                print("Text field: \(textField?.text)")
                
                
                self.defaults.set(textField?.text, forKey: self.nameKey)
                
                if let name = self.defaults.value(forKey: self.nameKey) as? String {
                    self.nameCell.textLabel?.text = name
                }
                
                tableView.reloadData()
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        if tableView.indexPathForSelectedRow?.section == 1{
            let alert = UIAlertController(title: "Please Enter Your Birthday", message: "Please Enter MMM DD ex. Jun 05", preferredStyle: .alert)
            
            //            2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.placeholder = "MMM DD"
            }
            
            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
                //
                self.defaults.set(textField?.text, forKey: self.birthdayKey)
                
                if let birthday = self.defaults.value(forKey: self.birthdayKey) as? String {
                    self.birthdayCell.textLabel?.text = birthday
                }
                
                tableView.reloadData()
            }))
            
            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    
}
