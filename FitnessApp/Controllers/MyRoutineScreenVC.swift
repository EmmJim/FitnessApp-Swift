//
//  workoutDetail.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 10/01/25.
//

import UIKit
import SwiftUI

class MyRoutineScreenVC: UIViewController {
    @IBOutlet var infoView: UIView!
    @IBOutlet var timeImage: UIView!
    @IBOutlet var caloriesImage: UIView!
    @IBOutlet var roundCard: UIView!
    @IBOutlet var roundCardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        infoView.layer.cornerRadius = 25.0
        infoView.layer.borderWidth = 0.2
        infoView.layer.borderColor = UIColor.white.cgColor
        timeImage.layer.cornerRadius = 10.0
        caloriesImage.layer.cornerRadius = 10.0
        roundCard.layer.cornerRadius = 10.0
        roundCardImage.layer.cornerRadius = 10.0
        navigationController?.navigationBar.tintColor = UIColor(red: 165/255, green: 72/255, blue: 238/255, alpha: 1.0)
    }
    
    @IBAction func showVideoPressed(_ sender: UIButton) {
        let videoID = "09AYfVFf7pg"
        let youtubeView = YoutubeView(videoID: videoID)
        
        let hostingController = UIHostingController(rootView: youtubeView)
        
        hostingController.modalPresentationStyle = .fullScreen
        self.present(hostingController, animated: true, completion: nil)
    }
    
}
