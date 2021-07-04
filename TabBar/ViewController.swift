//
//  ViewController.swift
//  TabBar
//
//  Created by David Yoon on 2021/07/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1 // TabBarController를 버튼 액션에 넣어 화면 전환
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnMoveToPickerVIew(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

