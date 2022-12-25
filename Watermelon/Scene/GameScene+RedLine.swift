//
//  GameScene+RedLine.swift
//  Watermelon
//
//  
//

import SpriteKit
import SwiftUI

extension GameScene {
    // 显示红线的方法
    func makeRedline() {
        // 加载红线图片
        redline = SKSpriteNode(imageNamed: "redline")
        // 设置锚点为左下角
        redline.anchorPoint = CGPoint.zero
        // 设置位置在离屏幕顶部80像素的位置
        redline.position = CGPoint(x: 0, y: screen.height - 80)
        // screen.height - 80 - 150
        
        // 将红线添加到场景中
        addChild(redline)
        
        // 设置红线的初始大小为0
        redline.setScale(0)
        
        // .run() 方法用于执行动作
        // .repeat() 方法用于重复执行动作
        // .sequence() 方法用于顺序执行动作
        // .fadeIn() 方法用于淡入
        // .fadeOut() 方法用于淡出
        // .withDuration() 方法用于设置动作的持续时间
        // count: -1 表示无限重复
        // run方法的参数是一个动作 SKAction 类型
        redline.run(.repeat(.sequence([
            .fadeIn(withDuration: 0.4),
            .fadeOut(withDuration: 0.4)
        ]), count: -1))
        
    }
    
    // 显示红线的方法 即把红线的大小设置为1
    func showInRedline() {
        redline.setScale(1)
    }
    
    // 隐藏红线的方法 即把红线的大小设置为0
    func showOutRedline() {
        redline.setScale(0)
    }
}
