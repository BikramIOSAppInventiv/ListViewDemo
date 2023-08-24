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
    @IBOutlet private weak var showUserAgeView: UIView!
    @IBOutlet private weak var userAgeLabel: UILabel!
        
    //MARK: - Private Properties
    
    var objCModel = UserListCellViewModel()
    
    //MARK: - View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setIntialUIData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setIntialUI()
    }
}

//MARK:- Private Methods

private extension UserDetailsViewController {
    
    func setIntialUI() {
        self.userProfilePicImageView.roundCorners(radius: 10.0, borderWidth: 0.0)
        self.showUserAgeView.setDiamondShape()
        self.userAgeLabel.setDiamondShape()
    }
    
    func setIntialUIData() {
        self.navigationItem.title = self.objCModel.userName
        self.userProfilePicImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.userProfilePicImageView.sd_setImage(with: URL(string: self.objCModel.largeUserImage), placeholderImage: UIImage(named: "userPlaceHolder.png"))
        self.userEmailLabel.text = "\(AppConstants.Titles.Email): \(self.objCModel.userEmailAddress)"
        self.userRegisteredDateLabel.text = "\(AppConstants.Titles.DateJoined): \(self.objCModel.registeredDate)"
        self.userDateOfBirthLabel.text = "\(AppConstants.Titles.DOB): \(self.objCModel.userDOB)"
        self.cityLabel.text = "\(AppConstants.Titles.City): \(self.objCModel.userCity)"
        self.stateLabel.text = "\(AppConstants.Titles.State): \(self.objCModel.userState)"
        self.countryLabel.text = "\(AppConstants.Titles.Country): \(self.objCModel.userCountry)"
        self.postCodeLabel.text = "\(AppConstants.Titles.Postcode): \(self.objCModel.userPostcode)"
        self.userAgeLabel.text = "\(self.objCModel.userAge)"
    }
    
}

//MARK:- Public Methods

extension UserDetailsViewController {
    
    @objc func bindListViewData(model: UserListCellViewModel) {
        objCModel = model
    }
    
}
