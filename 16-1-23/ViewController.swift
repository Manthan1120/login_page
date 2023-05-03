//
//  ViewController.swift
//  16-1-23
//
//  Created by R86 on 16/01/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var signInLablr: UIButton!
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Sqlite.createFile()
        signInLablr.layer.cornerRadius = 5
        signInLablr.layer.masksToBounds = true
    }
    
    @IBAction func forgotePasswordPage(_ sender: UIButton) {
        navigationForForgotePage()
    }
    @IBAction func LoginButtonaction(_ sender: UIButton) {
        
        
        if userNameTextFiled.text == "" && passwordTextFiled.text == "" {
            showAlert(tital: "Please enter your user name & password")
        }
        else if userNameTextFiled.text == "" {
            showAlert(tital: "Please enter your user name")
        }
        else if passwordTextFiled.text == ""{
            showAlert(tital: "Please enter your Password")
        }
        else if passwordTextFiled.text?.count ?? 0 < 6 {
            showAlert(tital: "Please enter your password minimum 6 charactor or alphabets")
        }
        else if userNameTextFiled.text != "Manthan" {
            showAlert(tital: "Invalide User name")
        }

        else if passwordTextFiled.text != "123456" {
            showAlert(tital: "Wrong password")
        }
        else if userNameTextFiled.text == "Manthan" && passwordTextFiled.text == "123456" {
            navigationForHomePage()
        }
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
    
        navigationForSignInPage()
    }
    func showAlert(tital:String) {
        let alert = UIAlertController(title: "Error", message: tital, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: nil))
        present(alert, animated:true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func navigationForHomePage() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "HomePage") as! HomePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationForForgotePage() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordPage") as! ForgotPasswordPage
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationForSignInPage() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "signInPage") as! signInPage
        navigationController?.pushViewController(navigation, animated: true)
    }
   
    
}


