//
//  LoginViewController.swift
//  carousel
//
//  Created by Smith, Trevor on 10/3/16.
//  Copyright © 2016 Smith, Trevor. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            scrollView.delegate = self
            scrollView.contentSize = scrollView.frame.size
            scrollView.contentInset.bottom = 100
        
            buttonInitialY = buttonParentView.frame.origin.y
            buttonOffset = -120
        
            NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
                
                // Move the button up above keyboard
                self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
                // Scroll the scrollview up
                self.scrollView.contentOffset.y = self.scrollView.contentInset.bottom
            
        }
        
            NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        
        // Start animating the activity indicator
        loginIndicator.startAnimating()
        
        if emailField.text == "tim@codepath.com" && passwordField.text == "123456" {
            
            delay(2){
                self.loginIndicator.stopAnimating()
                // perform the Segue to the next screen.
                self.performSegue(withIdentifier: "tutorialSegue", sender: nil)
            }
           
        } else {
            
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Create and Show UIAlertController...see guide, Using UIAlertController
                let alertController = UIAlertController(title: "Email or Password Incorrect", message: "Please enter your email address and password", preferredStyle: .alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            })
          
        }
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            let alertController = UIAlertController(title: "Email & Password Required", message: "Please enter your email address and password", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else {
            
        }
        
        
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
