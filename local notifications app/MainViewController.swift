//
//  ViewController.swift
//  local notifications app
//
//  Created by admin on 20/12/2021.
//

import UIKit
//import CloudKit

class MainViewController: UIViewController {

    @IBOutlet weak var startcancelBtn: UIButton!
    @IBOutlet var mainLbl: [UILabel]!
    
    var currentTimer = TimeInterval(60.0)
    var timer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        mainLbl[0].text = timer.getTotalTime()
        mainLbl[1].text = timer.getCurrentTimerSet()
        if timer.started {
            mainLbl[2].text = "Timer ON"
            mainLbl[2].textColor = UIColor.blue
            startcancelBtn.setTitle("Cancel Timer", for: .normal)
        }
        else {
            mainLbl[2].text = "Timer OFF"
            mainLbl[2].textColor = UIColor.black
            startcancelBtn.setTitle("Start Timer", for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let logVC = segue.destination as! LogTableViewController
            logVC.timer = timer
        
    }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        if timer.started { //cancel timer
            timer.cancelCurrentTimer()
        }
        else { //start timer
            timer.startNewTimer(of: currentTimer)
            showAlert(title: "timer", message: timer.getCurrentTimerSet())
            timer.currentTimer = Timer.scheduledTimer(withTimeInterval: currentTimer, repeats: false) { t in
                print("timer fired!")
                self.showAlert(title: "Timer", message: "Your timer is finished")
                t.invalidate()
                self.timer.started = false
                self.updateUI()
            }
        }
        updateUI()
    }
    
    @IBAction func refreshBtnPressed(_ sender: UIBarButtonItem) {
        timer = MyTimer()
        updateUI()
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        currentTimer = sender.countDownDuration
        print("Current Timer = \(currentTimer)")
    }
    
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}


/*
 when in press start btn:
    - start an acutal interval counter somwhow
 notifications
*/
 




