//
//  UserDetailsViewController.swift
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

import UIKit
import SDWebImage

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
    
    //MARK: - Private Properties
    
    var objCModel = UserListModel()
    
    //MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setIntialUI()
    }
    
}

//MARK:- Private Methods

private extension UserDetailsViewController {
    
    func setIntialUI() {
        DispatchQueue.main.async {
            self.userProfilePicImageView.sd_setImage(with: URL(string: self.objCModel.largeUserImage), placeholderImage: UIImage(named: "placeholder.png"))
            self.userEmailLabel.text = self.objCModel.userEmailAddress
            self.userRegisteredDateLabel.text = self.objCModel.registeredDate
            self.userDateOfBirthLabel.text = self.objCModel.registeredDate
            self.cityLabel.text = self.objCModel.userCity
            self.stateLabel.text = self.objCModel.userState
            self.countryLabel.text = self.objCModel.userCountry
//            self.postCodeLabel.text = "\(self.objCModel.userPostcode)"
        }
    }
    
}

//MARK:- Public Methods

extension UserDetailsViewController {
    
    @objc func bindListViewData(model: UserListModel) {
        objCModel = model
    }
    
}
