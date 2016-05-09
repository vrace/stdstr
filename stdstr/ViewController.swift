//
//  ViewController.swift
//  stdstr
//
//  Created by Liu Yang on 5/5/16.
//  Copyright © 2016 Liu Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        foobar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

func foobar() {
    var str = "0123456789"
    
    var it = str.begin().advancedBy(2)
    print(str[it])
    
    it = str.insert(it, "x")
    print(str)
    print(str[it])
}


