//
//  ViewController.swift
//  SlideshowApp
//
//  Created by classtream on 2018/04/10.
//  Copyright © 2018年 ono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var forwordButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var timer: Timer!
    var current: Int! = 0
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNextSlide(next: Int(0))
        
        self.slideImageView.isUserInteractionEnabled = true
        self.slideImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImage)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 次の画像を設定
    func setNextSlide(next: Int) {
        self.current = self.current + next
        if next == -1 && self.current < 0 {
            self.current = 2
        } else if next == 1 && current > 2 {
            self.current = 0
        }
        self.imageName = String(self.current) + ".jpg";
        let slide: UIImage! = UIImage(named: self.imageName)
        slideImageView.image = nil
        slideImageView.image = slide
    }

    // 進む
    @IBAction func forward(_ sender: UIButton!) {
        self.setNextSlide(next: 1)
    }
    
    // 戻る
    @IBAction func back(_ sender: UIButton) {
        self.setNextSlide(next: -1)
    }
    
    // 再生・停止
    @IBAction func playOrPause(_ sender: UIButton) {
        self.playOrPauseWithParam(self.timer == nil)
    }
    
    
    // 再生・停止
    @IBAction func playOrPauseWithParam(_ play: Bool) {
        if play == true {
            self.forwordButton.isEnabled = false
            self.backButton.isEnabled = false
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.playButton.setTitle("停止", for: [])
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            self.playButton.setTitle("再生", for: [])
            
            self.forwordButton.isEnabled = true
            self.backButton.isEnabled = true
        }
    }
    
    // 戻ってきた時
    @IBAction func unwind(_ segue: UIStoryboard) {
        
    }
    
    // タイマー更新
    @objc func updateTimer(timer: Timer) {
        self.forward(nil)
    }
    
    // イメージタップ
    @objc func tapImage(gesture: UIGestureRecognizer) {
        if self.timer != nil {
            self.playOrPauseWithParam(false)
        }
        let bord: UIStoryboard = self.storyboard!
        let zoomViewController: ZoomViewController! = bord.instantiateViewController(withIdentifier: "zoomView") as! ZoomViewController
        
        zoomViewController.imageName = self.imageName
        present(zoomViewController, animated: true, completion: nil)
    }
}

