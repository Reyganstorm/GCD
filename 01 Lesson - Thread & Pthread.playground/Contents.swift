// Thread
// Operation
// GCD

import Darwin
import UIKit


// паралельная
// последовательная
// асинхронная

// Unix - POSIX


var thread = pthread_t(bitPattern: 0 ) // создаем поток
var attribit = pthread_attr_t() // создаем атрибут

pthread_attr_init(&attribit)

pthread_create(&thread, &attribit, { pointer in
    print("test 1")
    return nil
}, nil)

// 2 Thread

var nstread = Thread {
    print("test 2")
}

nstread.start()
nstread.cancel()
nstread.isFinished
