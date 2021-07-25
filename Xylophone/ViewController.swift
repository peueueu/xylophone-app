//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
//        print("I got pressed!!! 🎹")
        if let buttonTitle = sender.title(for: .normal) {
            playSound(soundName: buttonTitle, fileType: "wav")
        }
        print(type(of: sender))
        keyPressedAlphaEffect(sender: sender)
    }
    
    func keyPressedAlphaEffect(sender: UIButton){
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change
            sender.alpha = 1
        }
    }
    
    func playSound(soundName: String, fileType: String) {
        //        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        //
        //        do {
        //            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        //            try AVAudioSession.sharedInstance().setActive(true)
        //
        //            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        //            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        //
        //            /* iOS 10 and earlier require the following line:
        //            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        //
        //            guard let player = player else { return }
        //
        //            player.play()
        //
        //        } catch let error {
        //            print(error.localizedDescription)
        //        }
        let url = Bundle.main.url(forResource: soundName, withExtension: fileType)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}

