//: [Previous](@previous)

import UIKit
import Darwin
import Foundation

var str = "NSCondition()"

var available = false
var condition = pthread_cond_t()
var mutex = pthread_mutex_t()

class ContionMutexPrinter: Thread {
    
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    override func main() {
        printerMethod()
    }
    
    private func printerMethod() {
        pthread_mutex_lock(&mutex)
        print("Printer enter")
        while (!available) {
            pthread_cond_wait(&condition, &mutex)
        }
        available = false
        defer {
            pthread_mutex_unlock(&mutex)
        }
        print("Printer exit")
    }
}

class ContionMutexWriter: Thread {
    
    override init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    override func main() {
        writerMethod()
    }
    
    private func writerMethod() {
        pthread_mutex_lock(&mutex)
        print("writer enter")
        available = true
        pthread_cond_signal(&condition)
        available = false
        defer {
            pthread_mutex_unlock(&mutex)
        }
        print("writer exit")
    }
}

let printer = ContionMutexPrinter()
let writer = ContionMutexWriter()

printer.start()
writer.start()

//: [Next](@next)
