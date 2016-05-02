//
//  manageData.swift
//  DigitalMemorization
//
//  Created by guest on 2016/04/26.
//  Copyright © 2016年 chocoffee. All rights reserved.
//

import Foundation

class NoteTitle {
    class var titleArray: [AnyObject] { // クラスプロパティ（計算型プロパティ）
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.stringArrayForKey("TitleData") ?? []
    }
    
    class var titleNumber: Int { // クラスプロパティ（計算型プロパティ）
        let userDefaults = NSUserDefaults.standardUserDefaults()
        return userDefaults.integerForKey("TitleNumber")
    }
    
    class func saveTitle(gakuseiArray: [AnyObject]) { // クラスメソッド
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(gakuseiArray, forKey: "TitleData")
        userDefaults.synchronize()
    }
    
    class func saveTitleNumber(titleNumber: Int) { // クラスメソッド
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setInteger(titleNumber, forKey: "TitleNumber")
        userDefaults.synchronize()
    }

}
