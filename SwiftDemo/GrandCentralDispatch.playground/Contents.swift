import UIKit

//队列同步操作时，当程序在进行队列任务时，主线程的操作并不会被执行，这是由于当程序在执行同步操作时，会阻塞线程，所以需要等待队列任务执行完毕，程序才可以继续执行。
//let queue = DispatchQueue(label: "com.ffib.blog")
//
//queue.sync {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//
//for i in 10..<15 {
//    print(i)
//}
//队列异步操作时，当程序在执行队列任务时，不必等待队列任务开始执行，便可执行主线程的操作。与同步执行相比，异步队列并不会阻塞主线程，当主线程空闲时，便可执行别的任务。
//let queue1 = DispatchQueue(label: "com.ffib.blog")
//
//queue1.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//
//for i in 10..<15 {
//    print(i)
//}
//GCD内采用DispatchQoS结构体，如果没有指定QoS，会使用default,优先级相同时，两个队列是交替执行的
//let queue1 = DispatchQueue(label: "com.ffib.blog.queue1", qos: .utility)
//let queue2 = DispatchQueue(label: "com.ffib.blog.queue2", qos: .utility)
//
//queue1.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//
//queue2.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//CPU会把更多的资源优先分配给优先级高的队列，等到CPU空闲之后才会分配资源给优先级低的队列。
//let queue1 = DispatchQueue(label: "com.ffib.blog.queue1", qos: .default)
//let queue2 = DispatchQueue(label: "com.ffib.blog.queue2", qos: .utility)
//
//queue1.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//
//queue2.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//在创建队列时，不指定队列类型时，默认为串行队列。
//let queue = DispatchQueue(label: "com.ffib.blog.initiallyInactive.queue", qos: .utility)
//
//queue.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//
//queue.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//
//queue.async {
//    for i in 10..<15 {
//        print(i)
//    }
//}
//并行队列
//let queue = DispatchQueue(label: "com.ffib.blog.concurrent.queue", qos: .utility, attributes: .concurrent)
//
//queue.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//
//queue.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//
//queue.async {
//    for i in 10..<15 {
//        print(i)
//    }
//}
//另外在设置attributes参数时，参数还有另一个枚举值initiallyInactive，表示的任务不会自动执行，需要程序员去手动触发。如果不设置，默认是添加完任务后，自动执行。
//let queue = DispatchQueue(label: "com.ffib.blog.concurrent.queue", qos: .utility,
//                          attributes: .initiallyInactive)
//queue.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//queue.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//queue.async {
//    for i in 10..<15 {
//        print(i)
//    }
//}
//
////需要调用activate，激活队列。
//queue.activate()
//并行队列手动执行
//let queue = DispatchQueue(label: "com.ffib.blog.concurrent.queue", qos: .utility, attributes:
//    [.concurrent, .initiallyInactive])
//queue.async {
//    for i in 0..<5 {
//        print(i)
//    }
//}
//queue.async {
//    for i in 5..<10 {
//        print(i)
//    }
//}
//queue.async {
//    for i in 10..<15 {
//        print(i)
//    }
//}
//queue.activate()

//GCD提供了任务延时执行的方法，通过对已创建的队列，调用延时任务的函数即可。其中时间以DispatchTimeInterval设置，GCD内跟时间参数有关系的参数都是通过这一枚举来设置。
//let queue = DispatchQueue(label: "com.ffib.blog.after.queue")
//
//let time = DispatchTimeInterval.seconds(5)
//
//queue.asyncAfter(wallDeadline: .now() + time) {
//    print("wall dead line done")
//}
//
//queue.asyncAfter(deadline: .now() + time) {
//    print("dead line done")
//}
//如果想等到所有的队列的任务执行完毕再进行某些操作时，可以使用DispatchGroup来完成
//let group = DispatchGroup()
//let queue1 = DispatchQueue(label: "com.ffib.blog.queue1", qos: .utility)
//let queue2 = DispatchQueue(label: "com.ffib.blog.queue2", qos: .utility)
//queue1.async(group: group) {
//    for i in 0..<10 {
//        print(i)
//    }
//}
//queue2.async(group: group) {
//    for i in 10..<20 {
//        print(i)
//    }
//}
//
////group内所有线程的任务执行完毕
//group.notify(queue: DispatchQueue.main) {
//    print("done")
//}
//如果想等待某一队列先执行完毕再执行其他队列可以使用wait
//let group = DispatchGroup()
//let queue1 = DispatchQueue(label: "com.ffib.blog.queue1", qos: .utility)
//let queue2 = DispatchQueue(label: "com.ffib.blog.queue2", qos: .utility)
//queue1.async(group: group) {
//    for i in 0..<10 {
//        print(i)
//    }
//}
//queue2.async(group: group) {
//    for i in 10..<20 {
//        print(i)
//    }
//}
//group.wait()
////group内所有线程的任务执行完毕
//group.notify(queue: DispatchQueue.main) {
//    print("done")
//}
