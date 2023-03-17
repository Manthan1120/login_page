//
//  SendOTPPage.swift
//  16-1-23
//
//  Created by R86 on 16/01/23.
//

import UIKit

class SendOTPPage: UIViewController {

    @IBOutlet weak var otpTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if ((otpTextField.text?.count ?? 0) != 6) {
            showAlert(tital: "Enter valide OTP")
        }
        navigation()
    }
    func showAlert(tital:String) {
        let alert = UIAlertController(title: "Error", message: tital, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: nil))
        present(alert, animated:true, completion: nil)
        
    }
    func navigation() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "NewPasswordPage") as! NewPasswordPage
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
