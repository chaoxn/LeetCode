//
//  ViewController.swift
//  LeetCode
//
//  Created by it-ab on 2018/11/13.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let l1 = leetcode_01()
        print(l1.twoSum([1,2,3,4,5], 3))
    }
}

