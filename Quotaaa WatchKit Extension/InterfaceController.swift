//
//  InterfaceController.swift
//  Quotaaa WatchKit Extension
//
//  Created by VLT Labs on 6/2/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var quoteTitleLabel: WKInterfaceLabel!
    @IBOutlet weak var quoteTable: WKInterfaceTable!
    
    var sadQuoteArray = ["Never run back to whatever broke you", "If you don't let your past die, your past won't let you live", "Just because someone desires you, doesn't mean they value you", "It's not a problem if there's no solution to it"]

    var happyQuoteArray = ["Most folks are as happy as they make up their minds to be", "If you want to be happy, be", "Whoever is happy will make others happy too", "Life is like a roller coaster, live it, be happy, enjoy life"]
        
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.quoteTitleLabel.setText("Happy Quotes")
        settingQuoteTable(happyQuoteArray)
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func onHappyMenuItemPressed() {
        self.quoteTitleLabel.setText("Happy Quotes")
        settingQuoteTable(happyQuoteArray)
    }
    
    
    @IBAction func onSadMenuItemPressed() {
        self.quoteTitleLabel.setText("Sad Quotes")
        settingQuoteTable(sadQuoteArray)
    }
    
    func settingQuoteTable(quoteArray: [String]) {
        self.quoteTable.setNumberOfRows(quoteArray.count, withRowType: "quoteRow")
        
        var count = 0
        for quote in quoteArray {
            
            var row = self.quoteTable.rowControllerAtIndex(count) as! QuoteTableRow
            row.quoteLabel.setText("\(quote)");
            count++
        }
        
    }

}
