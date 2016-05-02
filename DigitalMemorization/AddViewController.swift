//
//  AddViewController.swift
//  DigitalMemorization
//
//  Created by guest on 2016/04/26.
//  Copyright © 2016年 chocoffee. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enteredTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredTitle.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        enteredTitle.resignFirstResponder()
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

    @IBAction func addTitle() {
        var titleArray = NoteTitle.titleArray // NSUserDefaultsオブジェクトから読み込み
        titleArray.append(self.enteredTitle.text!) // 配列に1行追加
        NoteTitle.saveTitle(titleArray) // NSUserDefautlsオブジェクトに配列を保存
        
        // ひとつ前のTableViewを更新する処理（present modallyで呼び出された場合）
        let navigationController = self.presentingViewController as! UINavigationController
        let tableViewController = navigationController.topViewController as! UITableViewController
        tableViewController.viewDidLoad() // 一つ前のViewControllerのgakuseiArrayを更新
        tableViewController.tableView.reloadData() // TableViewの再描画
        
        self.dismissViewControllerAnimated(true, completion: nil) // モーダルビューを引っ込める
    }
}
