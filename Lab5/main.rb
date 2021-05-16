require 'socket'
server = TCPServer.new('0.0.0.0', 3000)

while connection = server.accept
  request = connection.gets
  method, full_path = request.split(' ')
  path = full_path.split("?")[0]

  connection.print "HTTP/1.1 200\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print "Hello World!"

  connection.close
end