//: [Previous](@previous)

// Quality of service (QoS) Приоритеты потока
  
import Foundation
import UIKit
import Darwin


var lesson2 = "Quality of service (QoS) Приоритеты потока"

var pthread = pthread_t(bitPattern: 0)
var attribute = pthread_attr_t()
pthread_attr_init(&attribute)

pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
pthread_create(&pthread, &attribute, { pointer in
    print("test")
    return nil
}, nil)

let nsThread = Thread{
    print("test")
    print(qos_class_self())
}

nsThread.qualityOfService = .userInitiated
nsThread.start()


print(qos_class_main())


//: [Next](@next)
