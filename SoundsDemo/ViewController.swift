//
//  ViewController.swift
//  SoundsDemo
//
//  Created by Colin on 3/9/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var playChord: UIButton!
    @IBOutlet weak var playGun: UIButton!
    @IBOutlet weak var playMusic: UIButton!
    
    var chordPlayer = AVAudioPlayer()
    var gunPlayer = AVAudioPlayer()
    var musicPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chordPlayer = initAudio("c-major", fileType: "wav")!
        gunPlayer = initAudio("8-bit-gun", fileType: "aiff")!
        musicPlayer = initAudio("dont_stop_believing", fileType: "mp3")!
        
        chordPlayer.delegate = self
        gunPlayer.delegate = self
        musicPlayer.delegate = self
        
    }
    
    
    @IBAction func noteAction(sender: UIButton) {
        
        if !chordPlayer.playing {
            chordPlayer.play()
            playChord.setTitle("Stop Chord", forState: .Normal)
        } else {
         
            chordPlayer.stop()
            chordPlayer.currentTime = 0
            playChord.setTitle("Play Chord", forState: .Normal)
        }
    }
    
    @IBAction func gunAction(sender: UIButton) {
        if !gunPlayer.playing {
            gunPlayer.play()
            playGun.setTitle("Stop Gun Sound", forState: .Normal)
        } else {
            
            gunPlayer.stop()
            gunPlayer.currentTime = 0
            playGun.setTitle("Play Gun Sound", forState: .Normal)
        }
    }
    
    @IBAction func musicAction(sender: UIButton) {
        
        if !musicPlayer.playing {
            musicPlayer.play()
            playMusic.setTitle("Stop Music", forState: .Normal)
        } else {
            
            musicPlayer.stop()
            musicPlayer.currentTime = 0
            playMusic.setTitle("Play Music", forState: .Normal)
        }
    }
    
    
    
    func initAudio(fileName: NSString, fileType: NSString) -> AVAudioPlayer? {
        
        let asset = NSDataAsset(name: fileName as String)
        
        var audioPlayer : AVAudioPlayer?
        
        do {
            
            try audioPlayer = AVAudioPlayer(data: asset!.data, fileTypeHint: fileType as String)
            
        } catch {
            print("Audio Player Not Initialized")
        }
        return audioPlayer
        }
    
    
 
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if player == chordPlayer {
            playChord.setTitle("Play Chord", forState: .Normal)
        }
        else if player == gunPlayer {
            playGun.setTitle("Play Gun Sound", forState: .Normal)

        } else {
            playMusic.setTitle("Play Music", forState: .Normal)
        }
    }

}