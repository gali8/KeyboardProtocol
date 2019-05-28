//
//  KeyboardExtension.swift
//  Gap
//
//  Created by Daniele on 11/04/2019.
//  Copyright © 2019 nexor. All rights reserved.
//

import UIKit

protocol KeyboardProtocol {
    var scrollView: UIScrollView! { get set }
}

extension KeyboardProtocol where Self: UIViewController {
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

fileprivate extension UIViewController {
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let info = sender.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        
        let keyboardViewController = self as! KeyboardProtocol
        let bottomInset = keyboardSize - (self.tabBarController?.tabBar.frame.size.height ?? 0)

        if keyboardViewController.scrollView.transform.d == -1 { //keyboardViewController.scrollView.transform.d support viewcontroller rotation like for chat
            keyboardViewController.scrollView.contentInset.bottom = -bottomInset
            keyboardViewController.scrollView.scrollIndicatorInsets.bottom = 0
        }
        else {
            keyboardViewController.scrollView.contentInset.bottom = bottomInset
            keyboardViewController.scrollView.scrollIndicatorInsets.bottom = bottomInset
        }
        
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        let info = sender.userInfo!
        let duration: TimeInterval = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let keyboardViewController = self as! KeyboardProtocol
        keyboardViewController.scrollView.contentInset.bottom = 0
        keyboardViewController.scrollView.scrollIndicatorInsets.bottom = 0
        
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
}
