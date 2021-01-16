//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/01/04.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //ScoreViewController.swiftから、スコアの値を受け取る箱
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(correct)問正解！！"
     
    }
    //二つ前の画面へ戻る処理
    @IBAction func toTouButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
    }
    
  
}
