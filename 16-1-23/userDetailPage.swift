//
//  userDetailPage.swift
//  16-1-23
//
//  Created by R86 on 18/01/23.
//

import UIKit

class userDetailPage: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    
    @IBOutlet weak var userNameTextFiled: UITextField!
    @IBOutlet weak var submitLable: UIButton!
    
    @IBOutlet weak var genderTextFiled: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextFiled: UITextField!
    @IBOutlet weak var dateTextFiled: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Sqlite.createFile()
        submitLable.layer.cornerRadius = 5
        submitLable.layer.masksToBounds = true
    }
    
    @IBAction func addImageButtonAction(_ sender: UIButton) {
        alertForAddImage()
    }
    func alertForAddImage() {
        let alert = UIAlertController(title: "Your Choice", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Camara", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        img.image = info[.editedImage] as! UIImage
        dismiss(animated: true, completion: nil)
    }
    func openGallery() {
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        
        present(gallery, animated: true, completion: nil)
    }
    @IBAction func submitButtonAction(_ sender: UIButton) {
        
        
        
        Sqlite.addData( firstName: firstNameTextField.text!,name: userNameTextFiled.text!)
        
        
        
        if firstNameTextField.text == "" {
            showAlert(tital: "Enter you first name")
        }
        else if lastNameTextField.text == "" {
            showAlert(tital: "Enter your last name")
        }
        else if dateTextFiled.text == "" && monthTextFiled.text == "" && yearTextField.text == ""  {
            showAlert(tital: "Enter your Birth Date")
        }
        else if ((dateTextFiled.text?.count ?? 1) != 2 ) {
            showAlert(tital: "Enter valide Date")
        }
        else if ((monthTextFiled.text?.count ?? 1) != 2) {
            showAlert(tital: "Enter valide Month")
        }
        else if ((yearTextField.text?.count ?? 0) != 4 ) {
            showAlert(tital: "Enter valide Year")
        }
        else if genderTextFiled.text == "" {
            showAlert(tital: "Enter your gender first")
        }
        else if genderTextFiled.text != "male" && genderTextFiled.text != "female" && genderTextFiled.text != "other" {
            showAlert(tital: "Enter valide Gender type")
        }
        navigationForHomePage()
    }
    func showAlert(tital:String) {
        let alert = UIAlertController(title: "Error", message: tital, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction.init(title: "cancel", style: .destructive, handler: nil))
        present(alert, animated:true, completion: nil)
    }
    func navigationForHomePage() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "HomePage") as! HomePage
        navigationController?.pushViewController(navigation, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
