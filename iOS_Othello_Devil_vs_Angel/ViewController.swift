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
        
        playBackgroundMusic(filename: "chachacha")
        
        self.view.backgroundColor = UIColor.black
        
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
