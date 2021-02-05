//
//  ViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //枠線の太さ
        startButton.layer.borderWidth = 1
        //枠線の色
        startButton.layer.borderColor = UIColor.black.cgColor
        
        
    }


}

