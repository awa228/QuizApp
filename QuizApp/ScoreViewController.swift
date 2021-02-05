//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by 大嶋祐平 on 2021/01/04.
//

import UIKit
import GoogleMobileAds


class ScoreViewController: UIViewController, GADInterstitialDelegate{
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var sharButton: UIButton!
    @IBOutlet weak var returnTopButton: UIButton!
    

    
   
    
    //ScoreViewController.swiftから、スコアの値を受け取る箱
    var correct = 0

    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        scoreLabel.text = "\(correct)問正解！！"
        
        sharButton.layer.borderWidth = 1
        sharButton.layer.borderColor = UIColor.black.cgColor
        
        returnTopButton.layer.borderWidth = 1
        returnTopButton.layer.borderColor = UIColor.black.cgColor
     
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
                let request = GADRequest()
                interstitial.load(request)
                self.interstitial.delegate = self

        
        
    }
    
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました。", "#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTouButtonAction(_ sender: Any) {
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
            self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
        }
    }
