//
//  ViewController.swift
//  waifu2x-mac-app
//
//  Created by xieyi on 2018/1/24.
//  Copyright © 2018年 xieyi. All rights reserved.
//

import Cocoa
import waifu2x_mac

class DragImageView : NSImageView {

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow();
        self.registerForDraggedTypes([.fileURL]);
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        self.layer?.borderWidth = 0;
        if let wc = self.window?.windowController as? MainWindowController {
            wc.processBarItem.isEnabled = true
        }
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        self.layer?.borderWidth = 0;
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        self.layer?.borderColor = NSColor.red.cgColor;
        self.layer?.borderWidth = 2;
        return .every;
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .every;
    }
}

class ViewController: NSViewController {

    @IBOutlet weak var inImg: NSImageView!
    @IBOutlet weak var outImg: NSImageView!
    @IBOutlet weak var status: NSTextField!
    @IBOutlet weak var spinner: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.window?.styleMask.insert(.resizable)
        
    }
    
    
    @IBAction func onPick(_ sender: Any) {
        let dialog = NSOpenPanel()
        dialog.allowsMultipleSelection = false
        dialog.canChooseDirectories = false
        dialog.allowedFileTypes = ["public.image"]
        
        
        
        dialog.beginSheetModal(for: self.view.window!) { (resp) in
            if resp == NSApplication.ModalResponse.OK {
                let url = dialog.urls[0]
                self.inImg.image = NSImage(contentsOf: url)
                
                if let wc = self.view.window?.windowController as? MainWindowController {
                    wc.processBarItem.isEnabled = true
                }
//
            }
        }
    }
}
