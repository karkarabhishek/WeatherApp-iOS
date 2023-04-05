//
//  ViewController.swift
//  WeatherApp
//
//  Created by abhishek.karkar on 05/04/23.
//

import UIKit
import CoreLocation
import AVKit

class IntroductionViewController: UIViewController {

    //MARK: - Outlets -

    @IBOutlet weak var btnGetWetherInfo: UIButton!
    
    var introductionViewModel = IntroductionViewModel.init()

    //MARK: - Viewcontroller cycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        btnGetWetherInfo.layer.cornerRadius = 5.0
        setupViewModel()
    }

    //MARK: - Actions -

    @IBAction func btnGetWeatherInfoAction(_ sender: UIButton) {
        navigateToHomeVC(location: introductionViewModel.currentLocation)
    }
}

    //MARK: - Private extentions -

private extension IntroductionViewController {

    func setupViewModel() {
        introductionViewModel.onlocationRetrive = { [weak self] currentLocation in
            self?.navigateToHomeVC(location: currentLocation)
        }

        introductionViewModel.onError = { [weak self] (title, message) in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self?.present(alert, animated: true)
        }

        introductionViewModel.setupLocationManager()
    }

    func navigateToHomeVC(location: CLLocation) {
        if let homeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "HomeViewController") as? HomeViewController {
            let webService = WebServiceReal(baseUrlString: Constants.baseUrl, appId: Constants.appId)
            let weatherService = WeatherServiceReal(webService: webService)
            let homeviewModel = HomeViewModel(service: weatherService, currentLocation: location)
            homeVC.homeViewModel = homeviewModel
            homeVC.homeViewModel?.locality = introductionViewModel.defaultCity
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }

}



