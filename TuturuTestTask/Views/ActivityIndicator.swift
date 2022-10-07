//
//  ActivityIndicator.swift
//  TuturuTestTask
//
//  Created by Дмитрий Дуров on 05.10.2022.
//

import UIKit


class ActivityIndicator {
    
    static func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
