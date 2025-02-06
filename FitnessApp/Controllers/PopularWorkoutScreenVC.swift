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
    @IBOutlet var myPageControl: UISegmentedControl!
    @IBOutlet var dayLabel: UILabel!
    
    
    private let mySections: [String] = ["L","M", "M", "J", "V", "S", "D"]
    
    private var myDays: [DayStruct] = []
    
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
        
        // Get Database data
        loadData()
        
        sectionView1.isHidden = false
        
        // Establecer la primera sección seleccionada
        myPageControl.selectedSegmentIndex = 0
            
        // Cambiar el contenido basado en la selección inicial
        segmentedControlValueChanged(myPageControl)
        
        
    }
    
    func loadData() {
        db.collection("workout-plan").getDocuments { (querySnapshot, error) in
            if let e = error {
                print("There was an issue retrieving data from Firestore \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    var routines: [DayStruct] = []  // Arreglo para guardar las rutinas

                    for doc in snapshotDocuments {
                        let data = doc.data()
                        
                        if let days = data["days"] as? [[String: Any]] {  // Accede al arreglo "days"
                            for day in days {
                                if let dayName = day["dayName"] as? String,
                                   let routineName = day["routineName"] as? String,
                                   let routineData = day["routine"] as? [[String: Any]] {
                                    
                                    var exercises: [Exercise] = []
                                    
                                    for exerciseData in routineData {
                                        if let exercise = exerciseData["exercise"] as? String,
                                           let reps = exerciseData["reps"] as? Int,
                                           let series = exerciseData["series"] as? Int {
                                            let exerciseObj = Exercise(exercise: exercise, series: series, reps: reps)
                                            exercises.append(exerciseObj)
                                        }
                                    }
                                    
                                    let routine = DayStruct(dayName: dayName, routine: exercises, routineName: routineName)
                                    routines.append(routine)
                                }
                            }
                        }
                    }

                    // Aquí tienes el arreglo 'routines' con todas las rutinas cargadas
                    self.myDays.append(contentsOf: routines)
                    
                    DispatchQueue.main.async {
                        self.segmentedControlValueChanged(self.myPageControl)  // Esto llamará la función nuevamente con los datos actualizados
                    }
                }
            }
        }
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        print(myDays)
        
        switch sender.selectedSegmentIndex {
            case 0:
                    dayLabel.text = "Lunes"
                    guard myDays.count > 0 else {
                        
                        section1Label.text = "Sin datos disponibles"
                        return
                    }
                    
                    section1Label.text = myDays[0].dayName
            case 1:
                // Actualiza el contenido de sectionView2 si es necesario
                dayLabel.text = "Martes"
            
                guard myDays.count > 0 else {
                    section1Label.text = "Sin datos disponibles"
                    return
                }
                
                section1Label.text = myDays[1].dayName
            default:
                break
        }
    }
    
}
