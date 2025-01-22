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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "mysettingcell")
        
        if indexPath.section == 0 {
            cell.textLabel?.text = mySettingsOptions[indexPath.row]
        } else {
            cell.textLabel?.text = mySecondSectionSettingOptions[indexPath.row]
        }
        cell.backgroundColor = UIColor.white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        cell.textLabel?.textColor = UIColor.black
        cell.accessoryType = .disclosureIndicator
        
        // Establecer el color de fondo cuando el cell está seleccionado
                let selectedBackgroundView = UIView()
                selectedBackgroundView.backgroundColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)  // Color amarillo
                cell.selectedBackgroundView = selectedBackgroundView
        return cell
    }
}

extension SettingsScreenVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Obtener la celda seleccionada
                let selectedCell = tableView.cellForRow(at: indexPath)
                
                // Cambiar el color del texto cuando la celda es seleccionada
                selectedCell?.textLabel?.textColor = UIColor.white
        
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
            // Obtener la celda deseleccionada
            let deselectedCell = tableView.cellForRow(at: indexPath)
            
            // Restaurar el color del texto a su color original cuando se deselecciona
            deselectedCell?.textLabel?.textColor = UIColor.black  // El color original del texto
        }
    
}
