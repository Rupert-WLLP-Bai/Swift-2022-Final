//
//  GameScene.swift
//  Watermelon
//
//  
//

import SpriteKit
import SwiftUI

// MARK: - GameScene

// SKPhysicsContactDelegate 用于检测碰撞
class GameScene: SKScene, SKPhysicsContactDelegate {
    // 当前水果 用节点表示
    var nowFruit: SKSpriteNode!

    // 得分节点
    var scoreNode: SKSpriteNode!

    // 得分 初始值为0
    var score: Int = 0 {
        // 当得分发生变化时，更新得分节点
        didSet {
            // didSet 是属性观察器，当属性发生变化时，会自动调用
            updateScore()
        }
    }

    // 用于存放地面上的水果 用数组表示
    var groundFruits: [SKSpriteNode] = []

    var fruitUtil: FruitUtil!

    // 地面
    var ground: SKSpriteNode!

    // 游戏音效
    // 使用AudioUtil类来播放音效
    let falldownAudio = AudioUtil(resourceName: "falldown")
    let winAudio = AudioUtil(resourceName: "win")
    let bombAudio = AudioUtil(resourceName: "bomb")

    // 碰撞检测
    var groundCollision = false

    // 红线 超过红线游戏结束
    var redline: SKSpriteNode!

    // 红线是否显示
    var isShowingRedline = false

    // 游戏结束
    var gameover = false

    // 游戏结束节点
    var gameoverNode: SKSpriteNode!

    // 重新开始节点
    var restart: SKSpriteNode!

    func initGame() {
        fruitUtil = FruitUtil()
        makeUI()
        makeNowFruit()
        makeScoreNode()
        makeRedline()
    }

    // update函数
    // 每帧都会调用
    // 用于更新游戏状态
    override func update(_: TimeInterval) {
        // 如果游戏结束，直接返回
        if gameover { return }

        // 如果显示红线
        if isShowingRedline {
            for fruit in groundFruits {
                // 如果有水果的位置超过红线 游戏结束
                if fruit.position.y > screen.height - 80 {
                    gameover = true
                    // 设定状态 加载游戏结束界面
                    loadingGameover()
                    break
                }
            }
        }
        
        if isShowingRedline {
            if !checkWillShowingRedline() {
                showOutRedline()
                isShowingRedline = false
            }
        } else {
            if checkWillShowingRedline() {
                showInRedline()
                isShowingRedline = true
            }
        }
    }

    private func checkWillShowingRedline() -> Bool {
        for fruit in groundFruits {
            if fruit.position.y > screen.height - 80 - 150 {
                return true
            }
        }
        return false
    }
}

struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
