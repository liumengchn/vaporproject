import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)



public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    
    
    
    router.get("hello") { req in
        return "Hello, world! ,liu mengchen"
    }
    
//    let future_string: Future<String> = ["123"]
//    let future_int = future_string.map(to: Int.self, { (string) -> T in
//
//        print("string = \(string)")
//        return Int(string) ?? 0
//    })
    
    router.get("users") { request in
        
        return "this is a user information"
    }
    
    router.get("users", Int.parameter) { request -> String in

        let id = try request.parameters.next(Int.self)

        return "requested id is #\(id)"
    }
    
    router.get("path" , "to" , "something") { request in
        
        return "this is other information"
    }
    
    //post 请求
    struct LoginRequest: Content {
        
        var email: String = "991807013@qq.com"
        var password: String = "abc12345"
    }
    
    router.post("login") { request -> Future<HTTPStatus> in
        
        return try request.content.decode(LoginRequest.self).map(to: HTTPStatus.self) { loginRequest in
            print(loginRequest.email) // user@vapor.codes
            print(loginRequest.password) // don't look!
            return HTTPResponseStatus.ok
        }
    }
    
    
    struct User: Content {
        
        var name: String
        var email: String
    }
    
    router.get("user") { request -> User in
        
        
        let console = try request.make(Console.self)
        console.print("Hell o ")
        console.output("hello" + "world".consoleText(color: .blue))
        print("this is sssss")
        
        let input = console.input()
        console.print("you wrote : \(input)")
        
        let name = console.ask("what is your name?")
        console.print("you said: \(name)")
        
        return User(name: "vapor user", email: "user@vapor.code")
    }
    
    
    
    
    
    
    
    
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
