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
    var str = "foobar"
    str.replace(3, String.npos, "haha")
    print(str)
}

