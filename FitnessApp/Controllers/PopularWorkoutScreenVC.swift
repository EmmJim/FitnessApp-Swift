//
//  PopularWorkoutScreenVCViewController.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 31/01/25.
//

import UIKit

class PopularWorkoutScreenVC: UIViewController {
    
    @IBOutlet var sectionView1: UIStackView!
    @IBOutlet var sectionView2: UIStackView!
    @IBOutlet var myPageControl: UISegmentedControl!
    @IBOutlet var dayLabel: UILabel!
    
    
    private let mySections: [String] = ["L","M", "M", "J", "V", "S", "D"]
    
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
