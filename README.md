# JAlertView
[![CI Status](http://img.shields.io/travis/Pavel Katunin/JAlertView.svg?style=flat)](https://travis-ci.org/Pavel Katunin/JAlertView)
[![Version](https://img.shields.io/cocoapods/v/JAlertView.svg?style=flat)](http://cocoapods.org/pods/JAlertView)
[![License](https://img.shields.io/cocoapods/l/JAlertView.svg?style=flat)](http://cocoapods.org/pods/JAlertView)
[![Platform](https://img.shields.io/cocoapods/p/JAlertView.svg?style=flat)](http://cocoapods.org/pods/JAlertView)

![](JAlertView/pic.png)

## Usage

```
let alertView = JAlertView.init(title: "我是标题",
                                        message: "苹果全球开发者大会，英文全称是“Worldwide Developers Conference”。",
                                        cancelButtonTitle: "取消",
                                        sureButtonTitle: "确定")
        
alertView.show()
alertView.clickIndexClosure { (index) in
    print("index is \(index).")
}
```


## Requirements

Requires iOS SDK version > 8.0

## Installation

JAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "JAlertView"
```

## Author

jinxiansen, email: hi@jinxiansen.com

## License

JAlertView is available under the Apache License. See the LICENSE file for more info.