//
//  ContactFormViewController.swift
//  Trip Manager
//
//  Created by Ghenadie Isacenco on 15/5/23.
//

import UIKit

final class ContactFormViewController: UIViewController, ContactFormViewControllerProtocol {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSurname: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
        // MARK: - Vars
    var interator: ContactFormInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addListerens()
    }
    
    // MARK: - Protocol Methods
    func showCorrectField(_ type: ContactFormFieldType) {
        switch type {
        case .name:
            greenOutline(view: tfName)
        case .surname:
            greenOutline(view: tfSurname)
        case .email:
            greenOutline(view: tfEmail)
        case .phone:
            greenOutline(view: tfPhone)
        case .description:
            greenOutline(view: tvDescription)
        }
    }
    
    func showErrorField(_ type: ContactFormFieldType) {
        switch type {
        case .name:
            redOutline(view: tfName)
        case .surname:
            redOutline(view: tfSurname)
        case .email:
            redOutline(view: tfEmail)
        case .phone:
            redOutline(view: tfPhone)
        case .description:
            redOutline(view: tvDescription)
        }
    }
    
    func showSuccessPopup() {
        let alert = UIAlertController(title: "", message: "Report successfully saved", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: { _ in 
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    private func configure() {
        setBorder(forView: tfName)
        setBorder(forView: tfSurname)
        setBorder(forView: tfEmail)
        setBorder(forView: tfPhone)
        setBorder(forView: tvDescription)
    }
    
    private func addListerens() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollViewBottomConstraint.constant = -keyboardSize.height
            scrollView.contentSize = contentView.frame.size
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollViewBottomConstraint.constant = 0
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        resignAllResponders()
    }
    
    private func resignAllResponders() {
        tfName.resignFirstResponder()
        tfSurname.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfPhone.resignFirstResponder()
        tvDescription.resignFirstResponder()
    }
    
    private func greenOutline(view: UIView) {
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.borderWidth = 1
    }
    
    private func redOutline(view: UIView) {
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1
    }
    
    private func setBorder(forView view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1).cgColor
        view.layer.cornerRadius = 4
    }
    
    @IBAction func sendAction(_ sender: Any) {
        resignAllResponders()
        interator?.validateField(type: .name, value: tfName.text)
        interator?.validateField(type: .surname, value: tfSurname.text)
        interator?.validateField(type: .email, value: tfEmail.text)
        interator?.validateField(type: .phone, value: tfPhone.text)
        interator?.validateField(type: .description, value: tvDescription.text)
        
        let model = ContactFormFieldModel(name: tfName.text ?? "", surname: tfSurname.text ?? "", email: tfEmail.text ?? "", phone: tfPhone.text ?? "", description: tvDescription.text ?? "")
        self.interator?.saveFormData(model)
    }
}


