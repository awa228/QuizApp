//
//  SelectLevelViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/02/04.
//

import UIKit

class SelectLevelViewController: UIViewController {
    
    
    @IBOutlet weak var level1Button: UIButton!
    @IBOutlet weak var level2Button: UIButton!
    @IBOutlet weak var level3Button: UIButton!
    
    var selectTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        level1Button.layer.borderWidth = 1
        level1Button.layer.borderColor = UIColor.black.cgColor
        
        level2Button.layer.borderWidth = 1
        level2Button.layer.borderColor = UIColor.black.cgColor

        level3Button.layer.borderWidth = 1
        level3Button.layer.borderColor = UIColor.black.cgColor

       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLevel = selectTag
    
    }
    
    
    @IBAction func levelButtonAction(sender: UIButton){
        
        print(sender.tag)
        
        selectTag = sender.tag
        
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }
    
}
