//
//  ForgotPasswordPage.swift
//  16-1-23
//
//  Created by R86 on 16/01/23.
//

import UIKit

class ForgotPasswordPage: UIViewController {

    @IBOutlet weak var sendOtpLable: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendOtpLable.layer.cornerRadius = 5
        sendOtpLable.layer.masksToBounds = true
    }
    
    @IBAction func otpSendButton(_ sender: UIButton) {
        if emailTextField.text == "" {
            showAlert(tital: "Enter email First")
        }
        else if  ((phoneNumberTextField.text?.count ?? 0) != 10){
            showAlert(tital: "Enter valide number")
        }
        navigation()
        
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
    func navigation() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "SendOTPPage") as! SendOTPPage
        navigationController?.pushViewController(navigation, animated: true)
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
