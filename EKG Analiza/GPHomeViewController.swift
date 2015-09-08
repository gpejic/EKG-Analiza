//
//  GPHomeViewController.swift
//  EKG Analiza
//
//  Created by Goran Pejic on 06/09/15.
//  Copyright (c) 2015 Goran Pejic. All rights reserved.
//

import Foundation
import UIKit

enum Status {
    case NoSignal
    case HasSignal
    case UploadedSignal
}

var signalStatus = Status.NoSignal

class GPHomeViewController: UIViewController {
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - Helpers
    private func addSignal() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("updateLabel"), userInfo: nil, repeats: false)
    }
    
    private func uploadSignal() {
            addSignal()
    }
    
    func updateLabel() {
        startActivityIndicator(start: false)
        switch signalStatus {
        case .NoSignal:
            statusLabel.text    = "Postoji EKG signal"
            actionButton.setTitle("Upload Signala", forState: UIControlState.Normal)
            signalStatus        = .HasSignal
        case .HasSignal:
            statusLabel.text    = "Uplodovan EKG signal"
            actionButton.setTitle("Stop", forState: UIControlState.Normal)
            signalStatus        = .UploadedSignal
        default:
            break
        }
    }
    
    private func startActivityIndicator(#start: Bool) {
        if start {
            actionButton.hidden = true
            activityIndicator.startAnimating()
        }
        else {
            actionButton.hidden = false
            activityIndicator.stopAnimating()
        }
    }
    
    //MARK: - Actions
    @IBAction func actionButtonTap(sender: AnyObject) {
        startActivityIndicator(start: true)
        switch signalStatus {
        case .NoSignal:
            statusLabel.text    = "Loading..."
            addSignal()
        case .HasSignal:
            statusLabel.text    = "Upload se izvrsava..."
            uploadSignal()
        case .UploadedSignal:
            break
        default:
            break
        }
    }
}