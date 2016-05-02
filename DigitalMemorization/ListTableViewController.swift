//
//  ListTableViewController.swift
//  DigitalMemorization
//
//  Created by guest on 2016/04/26.
//  Copyright © 2016年 chocoffee. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var titleArray: [AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.titleArray = NoteTitle.titleArray
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

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
        return titleArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath)

        cell.textLabel!.text = titleArray[indexPath.row] as? String ?? ""

        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.titleArray.removeAtIndex(indexPath.row) // 配列から１行削除
            NoteTitle.saveTitle(self.titleArray) // NSUserDeaultsオブジェクトに配列を保存
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
        
        if editing { // 編集モード
            let addButton = UIBarButtonItem(
                barButtonSystemItem: .Add,
                target: self,
                action: "addRow"
            )
            self.navigationItem.setLeftBarButtonItem(addButton, animated: true) // 追加ボタンを表示
        } else { // 通常モード
            self.navigationItem.setLeftBarButtonItem(nil, animated: true)  // 追加ボタンを非表示
        }

    }
    
    func addRow() {
        performSegueWithIdentifier("toAddViewSegue", sender: nil)
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if fromIndexPath.section == toIndexPath.section { // 移動元と移動先は同じセクション
            let item: AnyObject = self.titleArray[fromIndexPath.row] // 移動対象を保持
            self.titleArray.removeAtIndex(fromIndexPath.row) // 配列から一度削除
            self.titleArray.insert(item, atIndex: toIndexPath.row) // 保持しておいた対象を挿入
            NoteTitle.saveTitle(self.titleArray) // NSUserDefaultsオブジェクトに配列を保存
        }
    }

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
