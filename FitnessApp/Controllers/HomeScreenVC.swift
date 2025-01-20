//
//  ViewController.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 07/01/25.
//

import UIKit

class HomeScreenVC: UIViewController {
    @IBOutlet var cardView: UIView!
    @IBOutlet var secondCardView: UIView!
    @IBOutlet var imageCard: UIImageView!
    @IBOutlet var secondImageCard: UIImageView!
    @IBOutlet var carouselImage: UIImageView!
    @IBOutlet var shadowView: UIView!
    @IBOutlet var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI(){
        cardView?.layer.cornerRadius = 25.0
        imageCard?.layer.cornerRadius = 25.0
        secondCardView?.layer.cornerRadius = 25.0
        secondImageCard?.layer.cornerRadius = 25.0
        carouselImage?.layer.cornerRadius = 25.0
        shadowView?.layer.cornerRadius = 25.0
        toolbar?.layer.cornerRadius = 20.0
        
        let backButton = UIBarButtonItem()
        backButton.title = "Atrás"
        navigationItem.backBarButtonItem = backButton
    }

}

