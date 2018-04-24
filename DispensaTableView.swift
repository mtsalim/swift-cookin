//
//  DispensaTableView.swift
//  CadeMinhaReceitaPrototype
//
//  Created by Student on 5/13/16.
//  Copyright © 2016 olhaMasQueGarotoMalCriado. All rights reserved.
//

import UIKit

class DispensaTableView: UITableViewController {
    
    var ingredientes = ["Batata", "Cenoura", "Hamburguer", "Azeitona", "Banana", "Laranja"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "CookIn - Background")!)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredientes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dispensaCell", forIndexPath: indexPath) as! DispensaCell
        
        // Configure the cell...
        cell.nomeDispensa.text = self.ingredientes[indexPath.row]
        
        return cell
    }
    
    /*override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            ingredientes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }*/
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?  {
        // add the action button you want to show when swiping on tableView's cell , in this case add the delete button.
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action , indexPath) -> Void in
            
            // Your delete code here.....
            self.ingredientes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        })
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction]
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    @IBAction func addIngrediente(sender: AnyObject) {
        
        //Criando o Alert Controller
        let popup = UIAlertController(title: "Adicionar Ingrediente", message: "", preferredStyle: .Alert)
        
        //Adicionando Text Field
        popup.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        //Pegando o valor digitado e passando para célula
        popup.addAction(UIAlertAction(title: "Adicionar", style: .Default, handler: { (action) -> Void in
            let textField = popup.textFields![0] as UITextField
            
            if textField.text != nil{
            self.ingredientes.append(textField.text!)
            }
            
            self.tableView.reloadData()
            
        }))
        
        // Apresentando o alerta
        self.presentViewController(popup, animated: true, completion: nil)
        
    }
    

}
