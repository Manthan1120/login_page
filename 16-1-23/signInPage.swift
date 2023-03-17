//
//  signInPage.swift
//  16-1-23
//
//  Created by R86 on 18/01/23.
//

import UIKit

class signInPage: UIViewController {
    @IBOutlet weak var signInLablr: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        signInLablr.layer.cornerRadius = 5
        signInLablr.layer.masksToBounds = true
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        if emailTextField.text == "" {
            showAlert(tital: "Enter e-mail first")
        }
        else if passwordTextField.text == "" {
            showAlert(tital: "Enter e-mail password")
        }
        else if passwordTextField.text?.count ?? 0<8 {
            showAlert(tital: "Invalide password")
        }
        navigationForUserDetailPage()
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
       
        navigation()
    }
    func navigation() {
        navigationController?.popToRootViewController(animated: true)
    }
    func navigationForUserDetailPage() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "userDetailPage") as! userDetailPage
        navigationController?.pushViewController(navigation, animated: true)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
