//
//  ViewController.swift
//  TestApp
//
//  Created by gourav jaiswal on 26/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//
import Foundation
import UIKit
import NVActivityIndicatorView

struct IndicatorSetting {
    static let size = CGSize(width: 180, height:180)
    
    /// Animation type.
    static let type: NVActivityIndicatorType = .ballScaleMultiple
    
    /// Color of activity indicator view.
    static let color: UIColor = UIColor.white
    
    /// Padding of activity indicator view.
    static let padding: CGFloat = 0
    
    /// Display time threshold to actually display UI blocker.
    static let displayTimeThreshold: Int = 0
    
    /// Minimum display time of UI blocker.
    static let minimumDisplayTime: Int = 0
    
    /// Background color of the UI blocker
    static let backgroundColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let restorationIdentifier = "NVActivityIndicatorViewContainer"
    static let welcomeScreenRestorationIdentifier = "WelcomeIndicatorViewContainer"
    static let updateScreenRestorationIdentifier = "updateViewContainer"


    
}


class ShawPulseLoaderView : NVActivityIndicatorViewable {
        
    public static let sharedInstance = ShawPulseLoaderView()
    var activityIndicatorView : NVActivityIndicatorView!
  
    private init() {
        activityIndicatorView = NVActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: IndicatorSetting.size.width, height: IndicatorSetting.size.height),
            type: IndicatorSetting.type,
            color: IndicatorSetting.color,
            padding: IndicatorSetting.padding)
    }

    let logoImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "animationLogo")
        theImageView.contentMode = .center
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
       
    func showShawLogoIndicator(){
        
        let containerView = UIView(frame: UIScreen.main.bounds)
        
        containerView.backgroundColor = IndicatorSetting.backgroundColor
        containerView.restorationIdentifier = IndicatorSetting.restorationIdentifier
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        
        containerView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(logoImageView)

        // constraints for Logo imageView
        logoImageView.widthAnchor.constraint(equalToConstant: IndicatorSetting.size.width).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: IndicatorSetting.size.height).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        
        // Add constraints for `activityIndicatorView`.
        ({
            let xConstraint = NSLayoutConstraint(item: containerView, attribute: .centerX, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: activityIndicatorView, attribute: .centerY, multiplier: 1, constant: 0)
            
           containerView.addConstraints([xConstraint, yConstraint])
            }())
        
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        keyWindow.addSubview(containerView)
        
        // Add constraints for `containerView`.
        ({
            let leadingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            
            keyWindow.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            }())

        logoImageView.sendSubview(toBack: activityIndicatorView)
    }
    
    func stopShawLogoIndicator(){
        self.hideShawLogoIndicator()
    }
    
    private func hideShawLogoIndicator() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        for item in keyWindow.subviews
            where item.restorationIdentifier == IndicatorSetting.restorationIdentifier {
                 DispatchQueue.main.async {
                item.layer.removeAllAnimations()
                item.removeFromSuperview()
                }
        }
        activityIndicatorView.stopAnimating()

       
    }
    
    
    func showWelcomeLogoIndicator(){
        
        let containerView = UIImageView(frame: UIScreen.main.bounds)
        
        containerView.backgroundColor = IndicatorSetting.backgroundColor
        containerView.restorationIdentifier = IndicatorSetting.welcomeScreenRestorationIdentifier
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        var imageList = [UIImage]()
        for countValue in 1...78
        {
            /*
           let strImageName : String = "sp\(countValue).jpg"
            let image  = UIImage(named:strImageName)
            imageList.append(image!)
*/
            imageList.append(getUncachedImage(named: "sp\(countValue)")!)

            
        }
        
        containerView.animationImages = imageList;
        containerView.animationDuration = 5.0
        containerView.animationRepeatCount = 1
        
        
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        keyWindow.addSubview(containerView)
        
        // Add constraints for `containerView`.
        ({
            let leadingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .leading, relatedBy: .equal, toItem: containerView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .trailing, relatedBy: .equal, toItem: containerView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow, attribute: .bottom, relatedBy: .equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0)
            
            keyWindow.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
            }())
      
        containerView.startAnimating()

    }
    
   
    //Reduce the memory
    func getUncachedImage (named name : String) -> UIImage?
    {
        if let resourcePath = Bundle.main.path(forResource: name, ofType: "jpg") {
            
            return UIImage(contentsOfFile: resourcePath)

        }
              return nil
    }
    
    
    
    func stopWelcomeLogoIndicator(){
        self.hideWelcomeLogoIndicator()
    }
    
    private func hideWelcomeLogoIndicator() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        for item in keyWindow.subviews
            where item.restorationIdentifier == IndicatorSetting.welcomeScreenRestorationIdentifier {
                item.layer.removeAllAnimations()
                item.removeFromSuperview()
        }
       
        
    }
    
    var isAnimating : Bool{
        return activityIndicatorView.isAnimating
    }
    
   
       
    }
