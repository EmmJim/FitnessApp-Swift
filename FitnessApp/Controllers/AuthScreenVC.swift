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
    @IBOutlet var halfView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Limpiar los textFields cuando la vista esté a punto de aparecer
        emailInput.text = ""
        passwordInput.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Crear el gesto para detectar toques en cualquier parte de la vista
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            
            // Agregar el gesto a la vista principal
            view.addGestureRecognizer(tapGesture)
        
        // Comprobar la sesión del usuario autenticado
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String {
            self.navigationController?.pushViewController(HomeScreenVC(email: email, provider: ProviderType.init(rawValue: provider)!), animated: false)
        }
        
        updateUI()
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

    func updateUI() {
        addBottomBorder(to: emailInput)
        addBottomBorder(to: passwordInput)
        
        halfView.layer.cornerRadius = 25.0
        
        registerButton.layer.cornerRadius = 10.0
        registerButton.layer.shadowColor = UIColor.black.cgColor // Color de la sombra (negro en este caso)
        registerButton.layer.shadowOffset = CGSize(width: 2, height: 2)  // Desplazamiento de la sombra (2 puntos a la derecha y 2 puntos hacia abajo)
        registerButton.layer.shadowOpacity = 0.5  // Opacidad de la sombra (50% de opacidad)
        registerButton.layer.shadowRadius = 4  // Radio de difuminado de la sombra (4 puntos de difuminado)
        registerButton.layer.masksToBounds = false
        
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.shadowColor = UIColor.black.cgColor // Color de la sombra (negro en este caso)
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 2)  // Desplazamiento de la sombra (2 puntos a la derecha y 2 puntos hacia abajo)
        loginButton.layer.shadowOpacity = 0.5  // Opacidad de la sombra (50% de opacidad)
        loginButton.layer.shadowRadius = 4  // Radio de difuminado de la sombra (4 puntos de difuminado)
        loginButton.layer.masksToBounds = false
    }
    
    func addBottomBorder(to textField: UITextField) {
        let bottomBorder = CALayer()
        
        // Establece el color del borde
        bottomBorder.backgroundColor = UIColor(red: 90/255, green: 112/255, blue: 252/255, alpha: 1).cgColor  // Color del borde
        
        // Establece el grosor del borde
        bottomBorder.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 0.7)
        
        // Agregar la capa de borde al UITextField
        textField.layer.addSublayer(bottomBorder)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)  // Esto hace que el teclado se oculte
    }
}
