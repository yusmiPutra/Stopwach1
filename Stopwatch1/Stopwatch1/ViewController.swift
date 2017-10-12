//
//  ViewController.swift
//  Stopwatch1
//
//  Created by Nando Septian Husni on 10/12/17.
//  Copyright © 2017 IMA STUDIO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //declare variable counter
    var counter = 0.0
    // declare timer 
    var timer = Timer()
    //declare isPlaying
    var isPlaying = false
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelStart: UIButton!
    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStop: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //menampilkan teks ke labelTimer
        labelTimer.text = String(counter)
        //agar button pause tidak aktif
        labelPause.isEnabled = false
    }
    @IBAction func btnStart(_ sender: Any) {
        // untuk mengecek apakah sedang playing atau tidak
        if(isPlaying){
            return
        }
        //button start tidak aktif
        labelStart.isEnabled = false
        //button pause aktif
        labelPause.isEnabled = true
        
        //mengatur timer sebagai schedule Timer dengan interval 0.1 dan memanggil updateTimer
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        //mengatur isPlaying nya true
        isPlaying = true
    }
    
    func UpdateTimer() {
        counter = counter + 0.1
        labelTimer.text = String(format: "%.1f", counter)
    }

    @IBAction func btnPause(_ sender: Any) {
        //agar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        
        isPlaying = false
        
    }
    
    @IBAction func btnReset(_ sender: Any) {
        // agar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        //mengatur isPlaying false
        isPlaying = false
        
        //mengatur counter nya menjadi 0 kkembali
        
        counter = 0.0
        
        //menampilkan timer ke label
        // fungsi dari String(counter) adalah mengubah nilai desimal counter ke dalam bentuk string
    labelTimer.text = String(counter)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

