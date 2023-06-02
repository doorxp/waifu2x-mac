//
//  ConfigView.swift
//  waifu2x-mac-app
//
//  Created by xieyi on 2020/10/22.
//  Copyright © 2020 谢宜. All rights reserved.
//

import Foundation
import AppKit

class ConfigView: NSView, NSTextFieldDelegate {
    
    @IBOutlet weak var animeButton: NSButton!
    @IBOutlet weak var photoButton: NSButton!
    
    @IBOutlet weak var noiseNoneButton: NSButton!
    @IBOutlet weak var noise0Button: NSButton!
    @IBOutlet weak var noise1Button: NSButton!
    @IBOutlet weak var noise2Button: NSButton!
    @IBOutlet weak var noise3Button: NSButton!
    
//    @IBOutlet weak var scaleNoneButton: NSButton!
//    @IBOutlet weak var scale2xButton: NSButton!
    
    @IBOutlet weak var tfWidth: NSTextField!
    @IBOutlet weak var tfHeigh: NSTextField!
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if UserDefaults.standard.string(forKey: "style") ?? "anime" == "anime" {
            animeButton.state = .on
        } else {
            photoButton.state = .on
        }
        switch UserDefaults.standard.string(forKey: "noise") ?? "1" {
        case "none":
            noiseNoneButton.state = .on
        case "0":
            noise0Button.state = .on
        case "2":
            noise2Button.state = .on
        case "3":
            noise3Button.state = .on
        default:
            noise1Button.state = .on
        }
//        if UserDefaults.standard.string(forKey: "scale") ?? "2x" == "2x" {
//            scale2xButton.state = .on
//        } else {
//            scaleNoneButton.state = .on
//        }
        
        tfWidth.stringValue =  UserDefaults.standard.string(forKey: "width") ?? "1024"
    
        tfHeigh.stringValue = UserDefaults.standard.string(forKey: "height") ?? "1024"
    }
    
    @IBAction func styleChanged(_ sender: NSButton) {
        if sender == animeButton {
            UserDefaults.standard.set("anime", forKey: "style")
        } else {
            UserDefaults.standard.set("photo", forKey: "style")
        }
    }
    @IBAction func noiseChanged(_ sender: NSButton) {
        if sender == noiseNoneButton {
            UserDefaults.standard.set("none", forKey: "noise")
        } else if sender == noise0Button {
            UserDefaults.standard.set("0", forKey: "noise")
        } else if sender == noise1Button {
            UserDefaults.standard.set("1", forKey: "noise")
        } else if sender == noise2Button {
            UserDefaults.standard.set("2", forKey: "noise")
        } else if sender == noise3Button {
            UserDefaults.standard.set("3", forKey: "noise")
        }
    }
    
    func controlTextDidChange(_ obj: Notification) {
        guard let o = obj.object as? NSTextField else {
            return;
        }
        if(obj.object is NSTextField) {
            
        }
        
        if(Int(o.stringValue) != nil) {
            if(o == tfHeigh) {
                UserDefaults.standard.setValue(o.stringValue, forKey: "height")
            }
            else if (o == tfWidth) {
                UserDefaults.standard.setValue(o.stringValue, forKey: "width")
            }
            
        }
        
        UserDefaults.standard.synchronize()
    }
    
    
//    @IBAction func scaleChanged(_ sender: NSButton) {
//        if sender == scaleNoneButton {
//            UserDefaults.standard.set("none", forKey: "scale")
//        } else if sender == scale2xButton {
//            UserDefaults.standard.set("2x", forKey: "scale")
//        }
//    }
}
