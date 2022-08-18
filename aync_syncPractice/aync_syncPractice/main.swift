//
//  main.swift
//  aync_syncPractice
//
//  Created by Chae_Haram on 2022/08/18.
//

import Foundation

func test() {
    DispatchQueue.global().async {
//        print(1)
        for i in 1...5 {
            print(i)
        }
        print("(1) global async 끝")
        
        DispatchQueue.main.async {
//            print(2)
            for i in 10...15 {
                print(i)
            }
            print("(3) main async 끝")
        }
        print("(2) 다 끝")
    }
}

func test2() {
    DispatchQueue.main.async {
        for i in 1...5 {
            print(i)
        }
        print("(1) main async 끝")
        
        DispatchQueue.global().async {
            for i in 20...25 {
                print(i)
            }
            print("(3) global async 끝")
        }
        print("(2) 다 끝")
    }
}

test()
test2()

