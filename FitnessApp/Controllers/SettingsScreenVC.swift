//
//  SettingsScreenVC.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 22/01/25.
//

import UIKit
import FirebaseAuth

class SettingsScreenVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewContainer: UIView!
    @IBOutlet var profileImage: UIImageView!
    
    private let mySettingsOptions = ["Edit Profile", "Security", "Notifications", "Privacy", "Log Out"]
    private let mySecondSectionSettingOptions = ["My Subscription", "Help & Support", "Terms and Policies"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.layer.cornerRadius = 25.0
        
        profileImage.layer.shadowColor = UIColor.black.cgColor  // Color de la sombra (negro en este caso)
        profileImage.layer.shadowOffset = CGSize(width: 4, height: 4)  // Desplazamiento de la sombra (2 puntos a la derecha y 2 puntos hacia abajo)
        profileImage.layer.shadowOpacity = 0.5  // Opacidad de la sombra (50% de opacidad)
        profileImage.layer.shadowRadius = 10  // Radio de difuminado de la sombra (4 puntos de difuminado)
        profileImage.layer.masksToBounds = false  // Asegurarse de que la sombra no se recorte
        
        
        tableViewContainer.layer.cornerRadius = 25.0
        tableViewContainer.layer.shadowColor = UIColor.black.cgColor  // Color de la sombra (negro en este caso)
        tableViewContainer.layer.shadowOffset = CGSize(width: 4, height: 4)  // Desplazamiento de la sombra (2 puntos a la derecha y 2 puntos hacia abajo)
        tableViewContainer.layer.shadowOpacity = 0.5  // Opacidad de la sombra (50% de opacidad)
        tableViewContainer.layer.shadowRadius = 10  // Radio de difuminado de la sombra (4 puntos de difuminado)
        tableViewContainer.layer.masksToBounds = false  // Asegurarse de que la sombra no se recorte
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SettingsCell", bundle: nil), forCellReuseIdentifier: "SettingsCellIdentifier")
        
        navigationController?.navigationBar.tintColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
    }
    
}

extension SettingsScreenVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        
        // Establecer el texto para el encabezado
        if section == 0 {
            label.text = "Account"
        } else {
            label.text = "Support & About"
        }
        label.textColor = UIColor.darkGray // Cambia el color del texto aquí
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 15, y: 0, width: tableView.frame.size.width, height: 30)
        
        // Agregar la etiqueta al encabezado
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return mySettingsOptions.count
        } else {
            return mySecondSectionSettingOptions.count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCellIdentifier", for: indexPath) as! SettingsCell
        
        if indexPath.section == 0 {
            cell.label.text = mySettingsOptions[indexPath.row]
        } else {
            cell.label.text = mySecondSectionSettingOptions[indexPath.row]
        }
        
        return cell
    }
}

extension SettingsScreenVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Obtener la celda seleccionada
                let selectedCell = tableView.cellForRow(at: indexPath) as! SettingsCell
        
        selectedCell.backgroundColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
        selectedCell.label.textColor = UIColor.white
        selectedCell.stackView.backgroundColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
        selectedCell.labelView.backgroundColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
            
            // Cambiar el tint de la imagen
        selectedCell.accessoryIcon.tintColor = UIColor.white
        
        print(mySettingsOptions[indexPath.row])
        if(mySettingsOptions[indexPath.row] == "Log Out"){
            print("Entra")
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "email")
            defaults.removeObject(forKey: "password")
            defaults.synchronize()
            
            do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
            } catch {
                print("Error al cerrar sesión")
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            let deselectedCell = tableView.cellForRow(at: indexPath) as! SettingsCell
            
            
        deselectedCell.label.textColor = UIColor.black
        deselectedCell.backgroundColor = UIColor.white
        deselectedCell.stackView.backgroundColor = UIColor.white
        deselectedCell.labelView.backgroundColor = UIColor.white
            
            // Cambiar el tint de la imagen
        deselectedCell.accessoryIcon.tintColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
        }
    
}
