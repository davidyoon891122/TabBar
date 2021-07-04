//
//  ViewController.swift
//  ImageView
//
//  Created by David Yoon on 2021/06/30.
//

import UIKit

class ImageViewController: UIViewController {
    //add variables
    var isZoom = false      // 이미지 확대 여부를 나타내는 bool 타입의 변수
    var imgOn: UIImage?     // 켜진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff: UIImage?    // 꺼진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView!     // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton!      // 버튼에 대한 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png")       // imgOn 변수에 "lamp_on.png" 이미지를 할당
        imgOff = UIImage(named: "lamp_off.png")     // imgOff 변수에 "lamp_off_png" 이미지를 할당
        
        imgView.image = imgOn   // 디폴트 이미지를 켜진 이미지로 imgView 객체에 할당
        
    }

    @IBAction func btnResizeImage(_ sender: UIButton) { // 확대 축소 버튼 클릭시 액션 함수
        let scale: CGFloat = 2.0 // CGFFloat Float과 같음 확대할 수치를 CGFloat으로 상수 선언
        var newWidth: CGFloat, newHeight: CGFloat // 기존 width, height에 scale로 연산된 값이 들어가게 될 변수 선언
        
        if (isZoom) {
            newWidth = imgView.frame.width/scale    // imgView.frame.width -> 현재 이미지 프레임의 가로 값 가져옴
            newHeight = imgView.frame.height/scale  // imgView.frame.height -> 현재 이미지 프레임의 세로 값 가져옴
            btnResize.setTitle("확대", for: .normal) // btnResize 버튼 아웃렛 텍스트 값 변경
        }else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight) // CGSize로 현재 이미지 imgView.frame.size에 새로운 사이즈 값 할당
        
        isZoom = !isZoom    // 버튼 클릭 후 bool 값 반전
        
    }
    
    @IBAction func switchResizeImage(_ sender: UISwitch) { // 스위치 버튼 on/off선택시 이미지 변경 작업 해주는 func
        if sender.isOn { // sender.isOn UISwitch에서 isOn 값 읽어서 처리
            imgView.image = imgOn // True이면 이미지 imgOn 처리
        } else {
            imgView.image = imgOff
        }
        
    }
}

