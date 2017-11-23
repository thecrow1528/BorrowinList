//
//  BeginViewController.swift
//  Borrowing List
//
//  Created by Mirza Durakovic on 17/11/2017.
//  Copyright © 2017 Mirza Durakovic. All rights reserved.
//

import UIKit

class BeginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var toWhomTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var serialTextField: UITextField!
    @IBOutlet weak var whenTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        
        func get(){
            let name = nameTextField.text
            let whom = toWhomTextField.text
            let value = valueTextField.text
            let serial = serialTextField.text
            let when = whenTextField.text
            //print(name! + whom! + value! + serial! + when!)
            let item = Item(name: name!, value: value!, serial: serial!, borrowedTo: whom!, dateOfReturn: when!)
            MyItems.shared.items.append(item)
        }
      
        get()
        
    }
  
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
        //MARK: Move TextFields to keyboard. Step 1: Add tap gesture to view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
        view.addGestureRecognizer(tapGesture)
        }
   

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: Move TextFields to keyboard. Step 7: Add observers to receive UIKeyboardWillShow and UIKeyboardWillHide notification.
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //MARK: Move TextFields to keyboard. Step 8: Remove observers to NOT receive notification when viewcontroller is in the background.
        removeObservers()
    }
    
    //MARK: Move TextFields to keyboard. Step 2: Add method to handle tap event on the view and dismiss keyboard.
    @objc func didTapView(gesture: UITapGestureRecognizer) {
        // This should hide keyboard for the view.
        view.endEditing(true)
    }
    
    //MARK:  Move TextFields to keyboard. Step 3: Add observers for 'UIKeyboardWillShow' and 'UIKeyboardWillHide' notification.
    func addObservers() {
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) {
            notification in
            self.keyboardWillShow(notification: notification)
        }
    }
    
    //MARK: Move TextFields to keyboard. Step 6: Method to remove observers.
    func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Move TextFields to keyboard. Step 4: Add method to handle keyboardWillShow notification, we're using this method to adjust scrollview to show hidden textfield under keyboard.
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 10, left: 0, bottom: frame.height + 50
            , right: 0)
        scrollView.contentInset = contentInset
    }
    
    //MARK: Move TextFields to keyboard. Step 5: Method to reset scrollview when keyboard is hidden.
    func keyboardWillHide(notification: Notification) {
        

        scrollView.contentInset = UIEdgeInsets.zero
    }


}
