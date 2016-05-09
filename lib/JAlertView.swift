//
//  JAlertView.swift
//  JAlertView
//
//  Created by 开发者 on 16/5/9.
//  Copyright © 2016年 jinxiansen. All rights reserved.
//

import UIKit

class JAlertView: UIView {
    
    typealias alertViewButtonClick = (index: Int) -> Void
    
    var clickClosure: alertViewButtonClick?
    
    func clickIndexClosure(closure:alertViewButtonClick?)
    {
        clickClosure = closure
    }
    
    let screen_Width = UIScreen.mainScreen().bounds.size.width
    let screen_Height = UIScreen.mainScreen().bounds.size.height
    let backGroundView = UIView() //承载内容View
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    var title = "" //标题
    var content = "" //内容
    let cancelButton = UIButton()
    let sureButton = UIButton()
    let tap = UITapGestureRecognizer()
    let grayMaskView = UIView()//蒙版
    
    init(title: String?, message: String?, cancelButtonTitle: String?, sureButtonTitle: String?) {
        super.init(frame: CGRect(x: 0, y: 0, width: screen_Width, height: screen_Height))
        
        self.titleLabel.text = title
        self.contentLabel.text = message
        self.cancelButton.setTitle(cancelButtonTitle, forState: .Normal)
        self.sureButton.setTitle(sureButtonTitle, forState: .Normal)
        createAlertView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createAlertView() {

        grayMaskView.frame=CGRectMake(0, 0,screen_Width, screen_Height)
        grayMaskView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        tap.addTarget(self, action: #selector(JAlertView.dismiss))
        self.addGestureRecognizer(tap)
        
        backGroundView.frame = CGRect(x: 30, y: screen_Height/2 - 100, width: screen_Width - 60, height: 200)
        backGroundView.backgroundColor = UIColor.whiteColor()
        backGroundView.layer.cornerRadius = 5
        backGroundView.clipsToBounds = true
        self.addSubview(backGroundView)
        
        let width = backGroundView.frame.size.width
        
        titleLabel.frame = CGRect(x: 0, y: 15, width: width, height: 25)
        titleLabel.textColor = RGB_Color(r: 66, g: 66, b: 66, a: 1)
        titleLabel.font = UIFont.systemFontOfSize(19)
        titleLabel.textAlignment = .Center
        backGroundView.addSubview(titleLabel)
        
        let attributes = [NSFontAttributeName: contentLabel.font]
        let size = contentLabel.text!.boundingRectWithSize(CGSizeMake(width-48, 1000), options: NSStringDrawingOptions.UsesLineFragmentOrigin , attributes:attributes, context: nil) //获取文本宽高
        
        contentLabel.frame = CGRect(x: 24, y: 56, width: width - 48, height: size.height)//根据宽高，设置高度。
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment=NSTextAlignment.Center
        contentLabel.textColor = RGB_Color(r: 66, g: 66, b: 66, a: 1)
        contentLabel.font = UIFont.systemFontOfSize(17)
        backGroundView.addSubview(contentLabel)
        
        //取消按钮
        let buttonWidth = (width - 30) / 2
        cancelButton.frame = CGRect(x: 10, y:CGRectGetMaxY(contentLabel.frame)+20, width: buttonWidth, height: 45)
        cancelButton.backgroundColor = RGB_Color(r: 234, g: 234, b: 234, a: 1)
        cancelButton.setTitleColor(RGB_Color(r: 150, g: 150, b: 150, a: 1), forState: UIControlState.Normal)
        cancelButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        cancelButton.layer.cornerRadius = 3
        cancelButton.clipsToBounds = true
        cancelButton.tag = 1
        cancelButton.addTarget(self, action: #selector(buttonClickAction(_:)), forControlEvents: .TouchUpInside)
        backGroundView.addSubview(cancelButton)
        //确认按钮
        sureButton.frame = CGRect(x: buttonWidth + 20 , y: CGRectGetMaxY(contentLabel.frame)+20, width: buttonWidth, height: 45)
        sureButton.backgroundColor = RGB_Color(r: 131, g: 149, b: 231, a: 1)
        sureButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        sureButton.titleLabel?.font = UIFont.systemFontOfSize(18)
        sureButton.layer.cornerRadius = 3
        sureButton.clipsToBounds = true
        sureButton.tag = 2
        sureButton.addTarget(self, action: #selector(buttonClickAction(_:)), forControlEvents: .TouchUpInside)
        backGroundView.addSubview(sureButton)
        
        //更新Frame.
        backGroundView.frame = CGRect(x: 0, y:0, width: screen_Width - 60, height:CGRectGetMaxY(sureButton.frame)+20)
        backGroundView.center=self.center
        
    }
    
    func buttonClickAction(sender: UIButton) {
        if (clickClosure != nil) {
            clickClosure!(index: sender.tag)
        }
        dismiss()
    }
    
    func dismiss() {
        
        grayMaskView.removeFromSuperview()
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.backGroundView.alpha = 0
            self.alpha = 0
            self.transform=CGAffineTransformScale(self.transform, 0.1, 0.1)
        }) { (finish) -> Void in
            if finish {
                self.removeFromSuperview()
            }
        }
    }
    
    func show() {
        
        let keyWindow = UIApplication.sharedApplication().keyWindow
        
        keyWindow?.addSubview(grayMaskView)
        
        self.alpha = 0
        keyWindow?.addSubview(self)
        
        self.transform = CGAffineTransformScale(self.transform, 0.1, 0.1)
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 1
            self.transform = CGAffineTransformIdentity
        }) { (finish) -> Void in
        }
        
    }
    
    func RGB_Color(r r: CGFloat, g:CGFloat, b:CGFloat, a: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }

    

}
