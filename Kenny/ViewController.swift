//
//  ViewController.swift
//  Kenny
//
//  Created by Gökcan Akoya on 16.03.2019.
//  Copyright © 2019 Gökcan Akoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kennyPic: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var bestScore: UILabel!
    @IBOutlet weak var time: UILabel!
    var counter = 0
    var timer = Timer()
    var myScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.oyunMotoru), userInfo: nil, repeats: true)
        counter=10
        kennyPic.isUserInteractionEnabled = true
        myScore = 0
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.scoreSay))
        kennyPic.addGestureRecognizer(gesture)
        
        
        
        
    }
    //skor tutma
    @objc func scoreSay() {
        myScore = myScore + 1
    }
    //yer degistirme fonksiyonu
    func yerDegistirme(count : Int) -> Void {
        if count % 5 == 0 {
            kennyPic.frame = CGRect(x: 150, y: 220, width: 50, height: 50)
        }
        else if count % 5 == 4 {
            kennyPic.frame = CGRect(x: 180, y: 170, width: 50, height: 50)
        }
        else if count % 5 == 3 {
            kennyPic.frame = CGRect(x: 10, y: 150, width: 50, height: 50)
        }
        else if count % 5 == 2 {
            kennyPic.frame = CGRect(x: 80, y: 290, width: 50, height: 50)
        }else if count % 5 == 1 {
            kennyPic.frame = CGRect(x: 250, y: 160, width: 50, height: 50)
        }
        
    }
    @objc func oyunMotoru () {
        yerDegistirme(count: counter)
        time.text = "Time: \(counter)"
        score.text = "Score: \(myScore)"
        counter = counter - 1
        if counter == 0 {
            timer.invalidate()
            alert()
        }
    }
    
    func alert (){
        let alert = UIAlertController.init(title: "DIKKAT!", message: "Oyun Bitti! Skorun: \(myScore)", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        let restartButton = UIAlertAction(title: "RESTART", style: UIAlertAction.Style.default, handler: { action in self.viewDidLoad() })
        alert.addAction(okButton)
        alert.addAction(restartButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }


}

