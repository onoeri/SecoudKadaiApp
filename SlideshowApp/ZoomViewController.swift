//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by classtream on 2018/04/11.
//  Copyright © 2018年 ono. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImageView: UIImageView!
    
    var image: UIImage!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 画像設定
        self.image = UIImage(named: self.imageName)
        self.zoomImageView.image = self.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 戻る
    @IBAction func back(_ sender: Any) {
        self.image = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
