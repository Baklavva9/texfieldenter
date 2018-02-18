//
//  ViewController.swift
//  textnew
//
//  Created by Izati Ng on 22/1/18.
//  Copyright © 2018 bklv. All rights reserved.
//  with squares...expandable text field.. when you enter..

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet var alternateField: UIView!
    
    var textHolder = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle text field user input through delegate callback
        textField?.delegate = self
    }
    
    // MARK: - Action
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textHolder = textField.text!
        reloadViewHoldingTextView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // keypad dismiss when user clicks "return" on software keypad
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: TextView Resize
    func resizeTextViewFrame() {
        
        textView?.delegate = self
        
        // width
        let fixedWidth = textView?.frame.size.width
        
        // create a new size
        let newSize: CGSize = textView!.sizeThatFits(CGSize(width: fixedWidth!, height: CGFloat(MAXFLOAT)))
        
        var newFrame = textView!.frame
        
        newFrame.size = CGSize(width: CGFloat(fmaxf(Float(newSize.width), Float(fixedWidth!))), height: newSize.height)
        
        textView!.frame = newFrame
        
    }
    
    func reloadViewHoldingTextView() {
        
        textView?.text = textHolder
        resizeTextViewFrame()
        
        alternateField?.layoutIfNeeded()
    }
    
}





