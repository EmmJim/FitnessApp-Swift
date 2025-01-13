//
//  workoutDetail.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 10/01/25.
//

import UIKit

class WorkoutDetail: UIViewController {
    @IBOutlet var infoView: UIView!
    @IBOutlet var timeImage: UIView!
    @IBOutlet var caloriesImage: UIView!
    @IBOutlet var roundCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoView.layer.cornerRadius = 25.0
        infoView.layer.borderWidth = 0.2
        infoView.layer.borderColor = UIColor.white.cgColor
        timeImage.layer.cornerRadius = 10.0
        caloriesImage.layer.cornerRadius = 10.0
        roundCard.layer.cornerRadius = 10.0
        navigationController?.navigationBar.tintColor = UIColor.white
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
