//
//  ViewController.swift
//  voiceTest
//
//  Created by MacStudent on 2017-06-26.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var voiceLabel : UILabel!
    var voiceTextField : UITextField!
    var voiceButton: UIButton!
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var Voicelanguage :String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fullsize = self.view.frame.size
        
        voiceLabel = UILabel(frame: CGRect(x:fullsize.width * 0.4, y:fullsize.height * 0.05, width: 80, height : 50))
        voiceLabel.center = CGPoint(x:fullsize.width * 0.5, y:fullsize.height * 0.1)
        voiceLabel.text = "Voice test"
        self.view.addSubview(voiceLabel)
        
        voiceTextField = UITextField(frame: CGRect(x:fullsize.width * 0.12, y:fullsize.height * 0.12, width: 230, height : 100))
        voiceTextField.center = CGPoint(x:fullsize.width * 0.5, y:fullsize.height * 0.22)

        voiceTextField.backgroundColor = UIColor.lightGray
        self.view.addSubview(voiceTextField)
        
        voiceButton = UIButton(frame: CGRect(x:fullsize.width * 0.3, y:fullsize.height * 0.4, width: 270, height : 30))
        voiceButton.center = CGPoint(x:fullsize.width * 0.5, y:fullsize.height * 0.4)
        voiceButton.setTitle("speak out what you input", for: .normal)
        voiceButton.tintColor = UIColor.white
        voiceButton.backgroundColor = UIColor.red
        
        self.view.addSubview(voiceButton)
        
        // speak out
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            do{
                try AVAudioSession.sharedInstance().setActive(true)
            }catch{
                
            }
        }catch{
            
        }
        
        
        voiceButton.addTarget(self, action: #selector(speakout), for: .touchDown)
        
        Voicelanguage = "en-US"
//         Voicelanguage = "zh-tw"
        
    }
    
    func speakout(){
        
        myUtterance = AVSpeechUtterance(string: voiceTextField.text!)
        myUtterance.rate = 0.4
        myUtterance.pitchMultiplier = 1.2
        myUtterance.postUtteranceDelay = 0.1
        myUtterance.volume = 1
        myUtterance.voice = AVSpeechSynthesisVoice(language:Voicelanguage )
        synth.speak(myUtterance)
        
    }

    override
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

