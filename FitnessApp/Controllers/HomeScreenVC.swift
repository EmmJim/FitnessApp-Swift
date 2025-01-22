//
//  ViewController.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 07/01/25.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

enum ProviderType: String {
    case basic
    case google
}

class HomeScreenVC: UIViewController {
    @IBOutlet var cardView: UIView!
    @IBOutlet var secondCardView: UIView!
    @IBOutlet var imageCard: UIImageView!
    @IBOutlet var secondImageCard: UIImageView!
    @IBOutlet var carouselImage: UIImageView!
    @IBOutlet var shadowView: UIView!

    //Variables
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        //Guardamos los datos del usuario
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        defaults.synchronize()
    }
    
    func updateUI(){
        cardView?.layer.cornerRadius = 25.0
        imageCard?.layer.cornerRadius = 25.0
        secondCardView?.layer.cornerRadius = 25.0
        secondImageCard?.layer.cornerRadius = 25.0
        carouselImage?.layer.cornerRadius = 25.0
        shadowView?.layer.cornerRadius = 25.0
        
        let backButton = UIBarButtonItem()
        backButton.title = "Atrás"
        navigationItem.backBarButtonItem = backButton
    }
    @IBAction func toggleDrawer(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "provider")
        defaults.synchronize()
        
        switch provider {
        case .basic, .google:
            do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
            } catch {
                print("Error al cerrar sesión")
                
            }
        }
    }
    @IBAction func cardPressed(_ sender: Any) {
        self.navigationController?.pushViewController(MyRoutineScreenVC(), animated: true)
    }
    
    @IBAction func goToSettings(_ sender: Any) {
        print("Entra 2")
        self.navigationController?.pushViewController(SettingsScreenVC(), animated: true)
    }
}

