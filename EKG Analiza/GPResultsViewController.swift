//
//  GPResultsViewController.swift
//  EKG Analiza
//
//  Created by Goran Pejic on 09/09/15.
//  Copyright (c) 2015 Goran Pejic. All rights reserved.
//

import Foundation
import UIKit

class GPResultsViewController: UIViewController {
    
    @IBOutlet weak var resultsTitleLabel: UILabel!
    @IBOutlet weak var resultsActivityIndicator: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resultsActivityIndicator.startAnimating()
    }
}