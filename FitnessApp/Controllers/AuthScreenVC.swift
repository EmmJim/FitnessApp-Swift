//
//  AuthViewController.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 17/01/25.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthScreenVC: UIViewController {
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        if let email = emailInput.text, let password = passwordInput.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if let result = result, error == nil {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)

                    if let viewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenID") as? HomeScreenVC {
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                    //self.navigationController?.pushViewController(ViewController(), animated: true)
                } else {
                    print(error)
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
    }
    
}
