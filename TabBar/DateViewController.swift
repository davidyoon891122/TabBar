//
//  ViewController.swift
//  DatePicker
//
//  Created by David Yoon on 2021/06/30.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // 타이머 설정 인터벌마다 target(view)를 selector(함수로) 실행
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // sender UIDatePicker 객체
        
        let formatter = DateFormatter() // DateFormatter 객체
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // dateFormat 설정 년-월-일 시간:분 요일
        
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date) // label에 선택 시간 포멧에 넣어서 넘겨줌
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: (datePickerView.date))
        
    }
    
    @objc func updateTime() { // #selector()인자로 사용될 메소드를 선언할 때, Objective-C 와의 호환성을 위해 @objc 사용
        //lblCurrentTime.text = String(count)
        
        //count = count + 1
        
        let date = NSDate() // 현재 시간을 가져옴
        
        let formatter = DateFormatter() // 데이트 포멧을 위해 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // 해당 문자열 형식대로 데이트 포멧 세팅
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date) // 포멧터에 date 값 넣어서 텍스트로 반환
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        print("\(alarmTime), test \(currentTime)")
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
}

