//
//  ViewController.swift
//  RemoteMedia
//
//  Created by Dinesh Thangasamy on 2018-04-17.
//  Copyright © 2018 datatrix. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var serverStatus : UILabel!
    @IBOutlet weak var serverToggleButton : UIButton!
    @IBOutlet weak var logs : UITextView!
    
    var logString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateButtonState()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func toggleServerPressed () -> Void {
        switch (BonjourService.shared.status) {
        case .running:
            fallthrough
        case .starting:
            BonjourService.shared.stopService({ (completed, error) in
                if completed {
                    self.appendLog("Stopped server at \(NSDate())")
                } else {
                    self.appendLog("Failed to Stop server at \(NSDate())")
                }
                self.updateButtonState()
            })
        case .stopping:
            fallthrough
        case .stopped:
                BonjourService.shared.startService({ (completed, error) in
                    if completed {
                        self.appendLog("Started server at \(NSDate())")
                    } else {
                        self.appendLog("Failed to Start server at \(NSDate())")
                    }
                    self.updateButtonState()
                })
        }
    }

    @IBAction func clearLogsPressed () -> Void {
        self.clearLogs()
        let mediaLink = "http://vid2-ec.dmcdn.net/sec(xfff7eb32cda90b21099eb3c5ad6dee0)/video/175/410/393014571_mp4_h264_aac_hq.m3u8"
        let avPlayer = AVPlayer(url: URL(string: mediaLink)!)
        let playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.frame = self.view.frame
        self.view.layer.addSublayer(playerLayer)
        avPlayer.play()
    }
    
    //MARK: Logger functions
    func appendLog(_ log: String) {
        self.logString += "\n" + log
        self.logs.text = self.logString
    }
    
    func clearLogs() {
        self.logString = ""
        self.logs.text = self.logString
    }
    
    //MARK: Button state
    func updateButtonState() {
        switch (BonjourService.shared.status) {
        case .running:
            self.serverToggleButton.setTitle("Stop", for: .normal)
            self.serverToggleButton.backgroundColor = Color.red
        case .stopped:
            self.serverToggleButton.setTitle("Start", for: .normal)
            self.serverToggleButton.backgroundColor = Color.green
        default:
            self.serverToggleButton.backgroundColor = Color.yellow
        }
    }
}

