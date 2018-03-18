//
//  ViewController.swift
//  iOS_Othello_Devil_vs_Angel
//
//  Created by Yuta Yamada on 2018-03-17.
//  Copyright © 2018 Yuta Yamada. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var backgroundMusicPlayer:AVAudioPlayer!
    
    func playBackgroundMusic(filename: String) {
        
        //The location of the file and its type
        let url = Bundle.main.url(forResource: filename, withExtension: "mp3")
        
        //Returns an error if it can't find the file name
        if (url == nil) {
            print("Could not find the file \(filename)")
        }
        
        let error: NSError? = nil
        
        
        //Assigns the actual music to the music player
        do{backgroundMusicPlayer = try AVAudioPlayer(contentsOf:url!)
            
        }
        catch _{
            print("error")
        }
        
        //Error if it failed to create the music player
        if backgroundMusicPlayer == nil {
            print("Could not create audio player: \(error!)")
            return
        }
        
        //A negative means it loops forever
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playBackgroundMusic(filename: "chachacha")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

