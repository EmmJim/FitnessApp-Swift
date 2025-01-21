//
//  DrawerNavigator.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 20/01/25.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class DrawerNavigator: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    private let mySettings = ["Home", "My Routine", "Settings", "Profile", "Cerrar Sesión"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    



}

extension DrawerNavigator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
        }
        cell!.textLabel?.text = mySettings[indexPath.row]
        cell!.backgroundColor = UIColor(red: 163/255, green: 70/255, blue: 235/255, alpha: 1)
        cell!.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell!.accessoryType = .disclosureIndicator
        
        // Establecer el color de fondo cuando el cell está seleccionado
                let selectedBackgroundView = UIView()
                selectedBackgroundView.backgroundColor = UIColor(red: 92/25, green: 39/255, blue: 134/255, alpha: 1)  // Color amarillo
                cell!.selectedBackgroundView = selectedBackgroundView
        return cell!
    }
}

extension DrawerNavigator: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(mySettings[indexPath.row])
        if let navigationController = self.navigationController {
            print("NavigationController: \(navigationController)")
            if let rootVC = navigationController.viewControllers.first {
                navigationController.popToViewController(rootVC, animated: true)
            }
        } else {
            print("No se encontró un NavigationController")
        }
        if(mySettings[indexPath.row] == "Cerrar Sesión"){
            print("Entra")
            do {
                try Auth.auth().signOut()
                navigationController?.popToRootViewController(animated: true)
            } catch {
                print("Error al cerrar sesión")
                
            }
        }
    }
}
