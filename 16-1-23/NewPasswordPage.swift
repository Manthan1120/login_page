//
//  NewPasswordPage.swift
//  16-1-23
//
//  Created by R86 on 17/01/23.
//

import UIKit

class NewPasswordPage: UIViewController {

    @IBOutlet weak var newPasswordLable: UILabel!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var reEnterPasswordTextFeild: UITextField!
    @IBOutlet weak var reEnterPasswordLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func doneButtonAction(_ sender: UIButton) {
        
        if (newPasswordTextField.text?.count ?? 0<6) {
            showAlert(tital: "Enter atlist 6 later password")
        }
        else if reEnterPasswordTextFeild.text == "" {
            showAlert(tital: "Re-enter your password")
        }
        else if newPasswordTextField.text == ""{
            showAlert(tital: "Enter new password first")
        }
        else if newPasswordTextField.text != reEnterPasswordTextFeild.text {
             showAlert(tital: "Password is not match")
        }
        else{
            navigation()
        }
       
        
    }
    func showAlert(tital:String) {
        let alert = UIAlertController(title: "Error", message: tital, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: nil))
        present(alert, animated:true, completion: nil)
        
    }
    func navigation() {
        //let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        navigationController?.pushViewController(navigation, animated: true)
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
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
