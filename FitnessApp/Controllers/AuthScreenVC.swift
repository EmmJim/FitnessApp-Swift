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
        
        // Comprobar la sesión del usuario autenticado
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String {
            self.navigationController?.pushViewController(HomeScreenVC(email: email, provider: ProviderType.init(rawValue: provider)!), animated: false)
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        if let email = emailInput.text, let password = passwordInput.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeScreenVC(email: result.user.email!, provider: .basic), animated: true)
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
        if let email = emailInput.text, let password = passwordInput.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeScreenVC(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    print(error)
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

    
}
