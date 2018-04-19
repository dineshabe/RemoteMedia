//
//  ViewController.swift
//  RemoteMedia
//
//  Created by Dinesh Thangasamy on 2018-04-17.
//  Copyright © 2018 datatrix. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, BonjourServiceDelegate {
    
    @IBOutlet weak var logs : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    @IBAction func clearLogsPressed () -> Void {
       // Logger.shared.clearLogs()
        self.logs.text = Logger.shared.logString
    }
    
    //MARK: BonjourServiceDelegate
    func didGetUrl(_ urlStr: String) {
        Logger.shared.appendLog("Play url \(urlStr)")
        /*let mediaLink = "http://vid2-ec.dmcdn.net/sec(xfff7eb32cda90b21099eb3c5ad6dee0)/video/175/410/393014571_mp4_h264_aac_hq.m3u8"
         let avPlayer = AVPlayer(url: URL(string: mediaLink)!)
         let playerLayer = AVPlayerLayer(player: avPlayer)
         playerLayer.frame = self.view.frame
         self.view.layer.addSublayer(playerLayer)
         avPlayer.play()*/
    }
}

