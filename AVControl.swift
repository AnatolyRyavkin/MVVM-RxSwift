//
//  AVControl.swift
//  TestMVVM
//
//  Created by Anatoly Ryavkin on 26.02.2020.
//  Copyright © 2020 AnatolyRyavkin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

typealias ClouserRun = (UIControl) -> ()

extension UIControl{
    var avControl: AVControl{
        let avControlInit: AVControl = AVControl.init()
        avControlInit.controlSelf = self
        return avControlInit
    }
}

class AVControl: UIControl{

        var i = 0
        var controlSelf: UIControl! = nil
        var observable: Observable<UIControl>! = nil
        var observer: AnyObserver<UIControl>! = nil
        let disposeBag = DisposeBag()
        var taap:Observable<UIControl>{
            return self.tapp()
        }

        @objc func eventHandler(sender: UIControl){
            _ = self.observable.subscribe(self.observer).disposed(by: self.disposeBag)
        }

        func tapp() -> Observable<UIControl>{
            let controlType = (self.controlSelf .isMember(of: UIButton.self)) ? UIControl.Event.touchUpInside : UIControl.Event.allEvents
            self.controlSelf!.addTarget(self, action: #selector(eventHandler(sender:)), for: controlType)
            self.observable = Observable<UIControl>.create {observer in
                self.observer = observer
                observer.onNext(self.controlSelf!)
                return Disposables.create()
            }
            return self.observable
        }
}

