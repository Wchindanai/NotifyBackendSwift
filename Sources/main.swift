import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
 
// Create HTTP server.
let server = HTTPServer()
 
// Register your own routes and handlers
var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
        request, response in
        response.setHeader(.contentType, value: "text/html")
        response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
        response.completed()
    }
)
routes.add(method: .get, uri: "/api/member", handler:{
    request, response in
    response.setHeader(.contentType, value: "application/javascript")
    response.status = .created
    response.appendBody(string: "{\"message\":\"Helloworld\"}")
    response.completed()
})
routes.add(method: .get, uri: "/api/member/count", handler:{
    request, response in
    
    
    
})
 
// Add the routes to the server.
server.addRoutes(routes)
 
// Set a listen port of 8181
server.serverPort = 8181
 
do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
