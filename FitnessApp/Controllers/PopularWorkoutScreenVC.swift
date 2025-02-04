//
//  PopularWorkoutScreenVCViewController.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 31/01/25.
//

import UIKit
import FirebaseFirestore

class PopularWorkoutScreenVC: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet var sectionView1: UIStackView!
    @IBOutlet var section1Label: UILabel!
    @IBOutlet var sectionView2: UIStackView!
    @IBOutlet var myPageControl: UISegmentedControl!
    @IBOutlet var dayLabel: UILabel!
    
    
    private let mySections: [String] = ["L","M", "M", "J", "V", "S", "D"]
    
    private var myDays: [WorkoutPlan] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Mi Plan de Entrenamiento"
        navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white, // Puedes cambiar este color por cualquier color que desees
                .font: UIFont.boldSystemFont(ofSize: 18) // Opcional: cambia el tamaño o estilo de la fuente
            ]
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        myPageControl.removeAllSegments()
        for(index, value) in mySections.enumerated() {
            myPageControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        sectionView1.isHidden = false
        sectionView2.isHidden = true
        
        // Establecer la primera sección seleccionada
        myPageControl.selectedSegmentIndex = 0
            
        // Cambiar el contenido basado en la selección inicial
        segmentedControlValueChanged(myPageControl)
        
        // Get Database data
        loadData()
    }
    
    func loadData() {
        db.collection("workout-plan").getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        print(data)
                        if let myData = data["days"] as? [[String: Any]] { // Asegúrate de que "days" es un array de diccionarios
                            do {
                                // Convertir los datos de Firebase a modelos Swift
                                let jsonData = try JSONSerialization.data(withJSONObject: myData, options: [])
                                let decoder = JSONDecoder()
                                let days = try decoder.decode([DayStruct].self, from: jsonData)
                                let myNewWorkout = WorkoutPlan(days: days)
                                self.myDays.append(myNewWorkout)
                                if let firstDay = self.myDays.first?.days.first {
                                    print(firstDay.dayName)
                                    self.section1Label.text = firstDay.dayName
                                } else {
                                    print("No hay días disponibles.")
                                }
                            } catch {
                                print("Error al decodificar los datos: \(error)")
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        sectionView1.isHidden = true
        sectionView2.isHidden = true
        
        switch sender.selectedSegmentIndex {
            case 0:
                sectionView1.isHidden = false
                // Actualiza el contenido de sectionView1 si es necesario
                dayLabel.text = "Lunes"
            case 1:
                sectionView2.isHidden = false
                // Actualiza el contenido de sectionView2 si es necesario
                dayLabel.text = "Martes"
            default:
                break
        }
    }
    
}
