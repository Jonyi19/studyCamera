//
//  MyViewController.swift
//  StudyCamera
//
//  Created by Jonyi19 on 2015/11/04.
//  Copyright © 2015年  All rights reserved.
//  githubに登録

import Foundation
import UIKit

class MyViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBAction func didTouchButton(sender: AnyObject) {//ボタンを押すとフォトライブラリーを呼ぶ
        print("Hello")
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {//フォトライブラリーを画面にセット
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
     //       myImageView.image = image
            
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
}