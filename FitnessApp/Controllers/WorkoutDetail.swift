//
//  workoutDetail.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 10/01/25.
//

import UIKit

class WorkoutDetail: UIViewController {
    @IBOutlet var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoView.layer.cornerRadius = 25.0
        infoView.layer.borderWidth = 0.5
        infoView.layer.borderColor = UIColor.white.cgColor
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
