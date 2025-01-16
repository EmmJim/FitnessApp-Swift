//
//  workoutDetail.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 10/01/25.
//

import UIKit
import SwiftUI

class WorkoutDetail: UIViewController {
    @IBOutlet var infoView: UIView!
    @IBOutlet var timeImage: UIView!
    @IBOutlet var caloriesImage: UIView!
    @IBOutlet var roundCard: UIView!
    @IBOutlet var roundCardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infoView.layer.cornerRadius = 25.0
        infoView.layer.borderWidth = 0.2
        infoView.layer.borderColor = UIColor.white.cgColor
        timeImage.layer.cornerRadius = 10.0
        caloriesImage.layer.cornerRadius = 10.0
        roundCard.layer.cornerRadius = 10.0
        roundCardImage.layer.cornerRadius = 10.0
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
    }
    
    @IBAction func showVideoPressed(_ sender: UIButton) {
        let videoID = "09AYfVFf7pg"
        let youtubeView = YoutubeView(videoID: videoID)
        
        let hostingController = UIHostingController(rootView: youtubeView)
        
        hostingController.modalPresentationStyle = .fullScreen
        self.present(hostingController, animated: true, completion: nil)
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
