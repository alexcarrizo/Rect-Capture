//
//  MainViewController.swift
//  Rect Capture
//
//  Created by Alex Carrizo on 7/21/17.
//  Copyright © 2017 Alex Carrizo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, CardIOPaymentViewControllerDelegate {

    @IBOutlet weak var ccImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CardIOUtilities.preload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scanCard(sender: AnyObject) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)!
        cardIOVC.detectionMode = .cardImageOnly
        cardIOVC.hideCardIOLogo = true
        cardIOVC.disableManualEntryButtons = true
        cardIOVC.modalPresentationStyle = .formSheet
        present(cardIOVC, animated: true, completion: nil)
    }
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            ccImage.image = info.cardImage
        }
        paymentViewController?.dismiss(animated: true, completion: nil)
    }
}
