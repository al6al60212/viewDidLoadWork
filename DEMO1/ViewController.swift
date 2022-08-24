//
//  ViewController.swift
//  DEMO1
//
//  Created by 董禾翊 on 2022/8/17.
//

import UIKit
import SwiftUI
import SpriteKit
import AVFoundation

class ViewController: UIViewController {
    var looper: AVPlayerLooper?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradient()
        let fileUrl = Bundle.main.url(forResource: "星星失眠", withExtension: "mp3")!
        let player = AVQueuePlayer()
        let playItem = AVPlayerItem(url: fileUrl)
        looper = AVPlayerLooper(player: player, templateItem: playItem)
        player.play()
    }
    func addGradient(){
        //背景漸層
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [CGColor(red: 0, green: 0, blue: 0, alpha: 1), CGColor(red: 0, green: 0, blue: 1, alpha: 1), CGColor(red: 1, green: 1, blue: 1, alpha: 1)]
        gradientLayer.locations = [0.23, 0.8, 1]
        view.layer.addSublayer(gradientLayer)
        //螢火蟲
        let skView = SKView(frame: view.frame)
        view.insertSubview(skView, at: 1)
        let scene = SKScene(size:skView.frame.size)
        skView.allowsTransparency = true
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.4)
        scene.backgroundColor = UIColor.clear
        let emitterNode = SKEmitterNode(fileNamed: "firefiles")
        scene.addChild(emitterNode!)
        skView.presentScene(scene)
        //草的剪影
        let grassView = UIImageView(image: UIImage(named: "草"))
        grassView.contentMode = .scaleAspectFill
        grassView.clipsToBounds = false
        grassView.frame = CGRect(x: 0, y: view.bounds.height - 200, width: view.bounds.width, height: 200)
        view.addSubview(grassView)
        //情侶色塊
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 39, y: 390))
        path.addQuadCurve(to: CGPoint(x: 56, y: 322), controlPoint: CGPoint(x: 31, y: 355))
        path.addQuadCurve(to: CGPoint(x: 47, y: 301), controlPoint: CGPoint(x: 65, y: 310))
        path.addQuadCurve(to: CGPoint(x: 36, y: 284), controlPoint: CGPoint(x: 37, y: 298))
        path.addQuadCurve(to: CGPoint(x: 40, y: 168), controlPoint: CGPoint(x: 34, y: 220))
        path.addQuadCurve(to: CGPoint(x: 101, y: 119), controlPoint: CGPoint(x: 38, y: 141))
        path.addLine(to: CGPoint(x: 103, y: 100))
        path.addLine(to: CGPoint(x: 125, y: 99))
        path.addLine(to: CGPoint(x: 123, y: 80))
        path.addQuadCurve(to: CGPoint(x: 113, y: 57), controlPoint: CGPoint(x: 107, y: 72))
        path.addCurve(to: CGPoint(x: 176, y: 16), controlPoint1: CGPoint(x: 95, y: 15), controlPoint2: CGPoint(x: 151, y: -9))
        path.addQuadCurve(to: CGPoint(x: 183, y: 73), controlPoint: CGPoint(x: 197, y: 33))
        path.addQuadCurve(to: CGPoint(x: 243, y: 97), controlPoint: CGPoint(x: 221, y: 55))
        path.addQuadCurve(to: CGPoint(x: 278, y: 136), controlPoint: CGPoint(x: 258, y: 141))
        path.addQuadCurve(to: CGPoint(x: 339, y: 190), controlPoint: CGPoint(x: 337, y: 136))
        path.addQuadCurve(to: CGPoint(x: 334, y: 256), controlPoint: CGPoint(x: 340, y: 220))
        path.addCurve(to: CGPoint(x: 332, y: 294), controlPoint1: CGPoint(x: 353, y: 261), controlPoint2: CGPoint(x: 346, y: 292))
        path.addQuadCurve(to: CGPoint(x: 349, y: 390), controlPoint: CGPoint(x: 364, y: 331))
        path.close()
        
        let coupleDraw = CAShapeLayer()
        coupleDraw.path = path.cgPath
        coupleDraw.lineWidth = 1
        coupleDraw.strokeColor = Color.black.cgColor
        coupleDraw.fillColor = Color.clear.cgColor
       //情侶色塊的中間透明
        path.move(to: CGPoint(x: 207, y: 256))
        path.addQuadCurve(to: CGPoint(x: 202, y: 319), controlPoint: CGPoint(x: 229, y: 289))
        path.addCurve(to: CGPoint(x: 207, y: 256), controlPoint1: CGPoint(x: 185, y: 296), controlPoint2: CGPoint(x: 209, y: 266))
        
        let emptyDraw = CAShapeLayer()
        emptyDraw.path = path.cgPath
        emptyDraw.lineWidth = 1
        emptyDraw.strokeColor = Color.clear.cgColor
        //path以外部分填滿顏色
        emptyDraw.fillRule = .evenOdd
        coupleDraw.addSublayer(emptyDraw)
        //為了方便移動繪製的path，加到view1裡
        let coupleImage = UIView(frame:CGRect(x: 0, y: 0, width: 390, height: 390))
        coupleImage.backgroundColor = .clear
        coupleImage.layer.addSublayer(coupleDraw)
        view.addSubview(coupleImage)
        view.insertSubview(coupleImage, belowSubview: skView)
        coupleImage.transform = CGAffineTransform(translationX: 0, y: view.bounds.height - 390)
        
        //心跳線條
        let heartPath = UIBezierPath()
        heartPath.move(to: CGPoint(x: 28, y: 200))
        heartPath.addLine(to: CGPoint(x: 79, y: 200))
        heartPath.addLine(to: CGPoint(x: 91, y: 161))
        heartPath.addLine(to: CGPoint(x: 101, y: 236))
        heartPath.addLine(to: CGPoint(x: 112, y: 175))
        heartPath.addLine(to: CGPoint(x: 118, y: 206))
        heartPath.addLine(to: CGPoint(x: 175, y: 206))
        heartPath.addCurve(to: CGPoint(x: 166, y: 144), controlPoint1: CGPoint(x: 145, y: 186), controlPoint2: CGPoint(x: 146, y: 142))
        heartPath.addQuadCurve(to: CGPoint(x: 185, y: 172), controlPoint: CGPoint(x: 182, y: 141))
        heartPath.addQuadCurve(to: CGPoint(x: 207, y: 147), controlPoint: CGPoint(x: 187, y: 143))
        heartPath.addCurve(to: CGPoint(x: 186, y: 206), controlPoint1: CGPoint(x: 225, y: 150), controlPoint2: CGPoint(x: 224, y: 191))
        heartPath.addLine(to: CGPoint(x: 255, y: 206))
        heartPath.addLine(to: CGPoint(x: 263, y: 169))
        heartPath.addLine(to: CGPoint(x: 279, y: 250))
        heartPath.addLine(to: CGPoint(x: 293, y: 153))
        heartPath.addLine(to: CGPoint(x: 303, y: 224))
        heartPath.addLine(to: CGPoint(x: 310, y: 206))
        heartPath.addLine(to: CGPoint(x: 354, y: 206))
        
        let heartBeat = CAShapeLayer()
        heartBeat.path = heartPath.cgPath
        heartBeat.lineWidth = 5
        heartBeat.strokeColor = Color.white.cgColor
        heartBeat.fillColor = Color.clear.cgColor
        //心跳線加入動畫
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 4
        animation.repeatCount = .greatestFiniteMagnitude
        heartBeat.add(animation, forKey: nil)
        //縮放位移調整位置
        let heartView = UIView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
        heartView.layer.addSublayer(heartBeat)
        view.addSubview(heartView)
        heartView.transform = CGAffineTransform(translationX: 220, y: 270).scaledBy(x: 0.3, y: 0.3)
        
        //毛玻璃
        let abc = UIVisualEffectView()
        abc.frame = CGRect(x: 0, y: view.bounds.height * 0.35, width: view.bounds.width, height: 150)
        abc.backgroundColor = UIColor.white
        abc.alpha = 0.2
        view.addSubview(abc)
        //文字lable
        let lable = UILabel(frame: CGRect(x: 0, y: view.bounds.height * 0.35, width: view.bounds.width, height: 150))
        //字體路徑及註冊
        let fontUrl = Bundle.main.url(forResource: "Running_Script", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(fontUrl, .process, nil)
        lable.text = " 世界上最浪漫的事\n      就是有你的陪伴"
        lable.numberOfLines = 0
        lable.textColor = .white
        lable.font = UIFont(name: "HanWangShinSuMedium", size: 25)
        view.addSubview(lable)
        
        //流星雨gif
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * 0.35))
        let animatedImage = UIImage.animatedImageNamed("6081.gif_wh300-", duration: 2.5)
        imageView.image = animatedImage
        view.addSubview(imageView)
        
        
    }
    struct ViewControllerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> ViewController {
            ViewController()
        }
        
        func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        }
        
        typealias UIViewControllerType = ViewController
        
        
    }
    struct ViewController_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerView()
        }
    }
}
