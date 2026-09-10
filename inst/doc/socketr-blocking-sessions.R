## ----blocking-server, eval=FALSE----------------------------------------------
# library(socketR)
# 
# server <- socket_create("inet", "stream")
# client <- NULL
# on.exit({
#   if (!is.null(client) && socket_is_open(client)) socket_close(client)
#   if (socket_is_open(server)) socket_close(server)
# }, add = TRUE)
# 
# socket_reuse_address(server, TRUE)
# socket_bind(server, "127.0.0.1", 45678L)
# socket_listen(server)
# cat("Waiting for Session 2...\n")
# 
# # This call blocks until Session 2 connects.
# client <- socket_accept(server)
# cat("Session 2 connected; waiting for data...\n")
# 
# # This call blocks until Session 2 sends bytes.
# # connection loop starts here; this call blocks until Session 2 sends the bytes.
# payload <- socket_receive(client, n = 1024L)
# cat("Received:", rawToChar(payload), "\n")
# socket_send(client, "ack from Session 1")
# 
# socket_close(client)

## ----blocking-client, eval=FALSE----------------------------------------------
# library(socketR)
# 
# client <- socket_create("inet", "stream")
# on.exit(if (socket_is_open(client)) socket_close(client), add = TRUE)
# 
# # This call blocks until Session 1 is listening and accepts the connection.
# socket_connect(client, "127.0.0.1", 45678L)
# 
# # communication loop starts here; this call blocks until Session 1 receives the bytes.
# socket_send(client, "hello from Session 2")
# 
# # This call blocks until Session 1 sends the acknowledgement.
# ack <- socket_receive(client, n = 1024L)
# cat("Received:", rawToChar(ack), "\n")

