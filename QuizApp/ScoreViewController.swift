//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/01/04.
//

import UIKit
import GoogleMobileAds


class ScoreViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var sharButton: UIButton!
    @IBOutlet weak var returnTopButton: UIButton!
    

    
   
    
    //ScoreViewController.swiftから、スコアの値を受け取る箱
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        

        scoreLabel.text = "\(correct)問正解！！"
        
        sharButton.layer.borderWidth = 1
        sharButton.layer.borderColor = UIColor.black.cgColor
        
        returnTopButton.layer.borderWidth = 1
        returnTopButton.layer.borderColor = UIColor.black.cgColor
     
        
      
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました。", "#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    
    //二つ前の画面へ戻る処理
    @IBAction func toTouButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
    }
    
  
    
    
    
}
