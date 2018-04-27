import App
import Service
import Vapor
import Foundation

// The contents of main are wrapped in a do/catch block because any errors that get raised to the top level will crash Xcode
do {
    var config = Config.default()
    var env = try Environment.detect()
    var services = Services.default()

    try App.configure(&config, &env, &services)

    let app = try Application(
        config: config,
        environment: env,
        services: services
    )

    try App.boot(app)

    
//    let client = try app.make(Client.self)
//    let res = try client.get("http://vapor.codes").wait()
//    print(res)
    
    
    
    
    
    
    /** 该应用程序的主要功能是启动您的服务器。 */
    try app.run()
    
} catch {
    print(error)
    exit(1)
}
