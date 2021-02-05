//
//  QuizViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/01/04.
//

import UIKit
import GoogleMobileAds

class QuizViewController: UIViewController {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    
    var bannerView: GADBannerView!
    
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLevel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(fileName: "quiz\(selectLevel)")
        csvArray.shuffle()
        print(csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
        print ("選択したレベルは\(selectLevel)です")
        
        answerButton1.layer.borderWidth = 1
        answerButton1.layer.borderColor = UIColor.black.cgColor
        
        answerButton2.layer.borderWidth = 1
        answerButton2.layer.borderColor = UIColor.black.cgColor
        
        answerButton3.layer.borderWidth = 1
        answerButton3.layer.borderColor = UIColor.black.cgColor
        
        answerButton4.layer.borderWidth = 1
        answerButton4.layer.borderColor = UIColor.black.cgColor

        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //ボタンを押すと呼ばれる
    @IBAction func btnAction(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            print("正解")
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("スコア:\(correctCount)")
        judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        //◯◯秒後に〜　の処理
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
        
    }
    
    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    
    func loadCSV(fileName: String) -> [String] {
        
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineCange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineCange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("error")
        }
        return csvArray
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: view.safeAreaLayoutGuide,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 0),
         NSLayoutConstraint(item: bannerView,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0)
        ])
    }
    
    
    
}
