//
//  ModalViewController.swift
//  ARNZoomImageTransition
//
//  Created by xxxAIRINxxx on 2015/08/08.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit

class ModalViewController: ARNModalImageTransitionViewController, ARNImageTransitionZoomable {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var closeButton : UIButton!
    
    @IBAction func tapCloseButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    deinit {
        println("deinit ModalViewController")
    }
    
    // MARK: - ARNImageTransitionZoomable
    
    func createTransitionImageView() -> UIImageView {
        var imageView = UIImageView(image: self.imageView.image)
        imageView.contentMode = self.imageView.contentMode
        imageView.clipsToBounds = true
        imageView.userInteractionEnabled = false
        imageView.frame = self.imageView!.frame
        return imageView
    }
    
    func presentationBeforeAction() {
        self.imageView.hidden = true
    }
    
    func presentationCompletionAction(completeTransition: Bool) {
        self.imageView.hidden = false
    }
    
    func dismissalBeforeAction() {
        self.imageView.hidden = true
    }
    
    func dismissalCompletionAction(completeTransition: Bool) {
        if !completeTransition {
            self.imageView.hidden = false
        }
    }
}
