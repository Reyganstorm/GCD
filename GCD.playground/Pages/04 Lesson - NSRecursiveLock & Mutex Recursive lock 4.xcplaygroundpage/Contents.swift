//: [Previous](@previous)

import UIKit
import Foundation
import Darwin


var str = "NSRecursiveLock"

class RecursiveMutexTest {
    private var mutex = pthread_mutex_t()
    private var attribute = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&attribute)
        pthread_mutexattr_settype(&attribute, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attribute)
    }
    
    func firstTask() {
        pthread_mutex_lock(&mutex)
        twoTask()
        defer {
            pthread_mutex_lock(&mutex)
        }
    }
    
    private func twoTask() {
        pthread_mutex_lock(&mutex)
        print("Finish")
        defer {
            pthread_mutex_lock(&mutex)
        }
    }
}

let recursive = RecursiveMutexTest()
recursive.firstTask()


let recursiveLock = NSRecursiveLock()

class RecursiveThread: Thread {
    
    override func main() {
        recursiveLock.lock()
        print("Thread acquired lock 1")
        callMe()
        defer {
            recursiveLock.unlock()
        }
        print("exit main")
    }
    
    func callMe() {
        recursiveLock.lock()
        print("Thread acquired lock 2")
        defer {
            recursiveLock.unlock()
        }
        print("exit call me")
    }
}

let thread = RecursiveThread()
thread.start()


//: [Next](@next)
