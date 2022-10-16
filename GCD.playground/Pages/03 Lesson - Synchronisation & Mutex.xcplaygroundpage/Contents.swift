//: [Previous](@previous)

import UIKit
import Darwin

var str = "Synchronisation & Mutex"


// C

//class SaveThread {
//
//    private var mutex = pthread_mutex_t()
//
//    init() {
//        pthread_mutex_init(&mutex, nil)
//    }
//
//    func someThod(completion: () -> ()) {
//        pthread_mutex_lock(&mutex)
//        completion()
//defer {
//    pthread_mutex_unlock(&mutex)
//}
//    }
//}

class SaveThread {
    
    private var lockMutex = NSLock()
    
    func someThod(completion: () -> ()) {
        lockMutex.lock()
        completion()
        lockMutex.unlock()
    }
}

var array = [String]()
let saveThread = SaveThread()

saveThread.someThod {
    print("test")
    array.append("1 thread")
}

saveThread.someThod {
    print("hello")
    array.append("2 thread")
}


//: [Next](@next)
