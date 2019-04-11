//
//  ViewController.swift
//  KeyboardProtocolDemo
//
//  Created by Daniele on 11/04/2019.
//  Copyright © 2019 nexor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardProtocol {
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var textfields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfields.forEach({ $0.delegate = self })
        self.registerForKeyboardNotification()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

