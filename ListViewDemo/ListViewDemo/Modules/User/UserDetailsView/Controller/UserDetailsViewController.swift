//
//  UserDetailsViewController.swift
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var userProfilePicImageView: UIImageView!
    @IBOutlet private weak var userEmailLabel: UILabel!
    @IBOutlet private weak var userRegisteredDateLabel: UILabel!
    @IBOutlet private weak var userDateOfBirthLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var postCodeLabel: UILabel!
    
    //MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setIntialUI()
    }
    
    
}

//MARK:- Private Methods

private extension UserDetailsViewController {
    
    func setIntialUI() {
        self.userEmailLabel.text = "Email: bikramjeet Singh"
        self.userRegisteredDateLabel.text = "Date Joined: 2 days ago"
        self.userDateOfBirthLabel.text = "DOB: 21st June 1982"
        self.cityLabel.text = "city: Salford"
        self.stateLabel.text = "state: File"
        self.countryLabel.text = "country United Kingdom"
        self.postCodeLabel.text = "postcode F14 7LN"
    }
    
}
