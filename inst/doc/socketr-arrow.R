## ----receiver, eval=FALSE-----------------------------------------------------
# library(socketR)
# library(arrow)
# 
# server <- socket_create("inet", "stream")
# peer <- NULL
# on.exit({
#   if (!is.null(peer) && socket_is_open(peer)) socket_close(peer)
#   if (socket_is_open(server)) socket_close(server)
# }, add = TRUE)
# 
# socket_reuse_address(server, TRUE)
# socket_bind(server, "127.0.0.1", 45679L)
# socket_listen(server)
# cat("Waiting for an Arrow table...\n")
# 
# peer <- socket_accept(server)
# peer_connection <- socket_connection(peer)
# received <- read_ipc_stream(peer_connection)
# print(received)

## ----sender, eval=FALSE-------------------------------------------------------
# library(socketR)
# library(arrow)
# 
# client <- socket_create("inet", "stream")
# on.exit(if (socket_is_open(client)) socket_close(client), add = TRUE)
# 
# table <- arrow_table(
#   id = 1:3,
#   name = c("Ada", "Grace", "Linus"),
#   score = c(9.5, 10.0, 8.75)
# )
# 
# socket_connect(client, "127.0.0.1", 45679L)
# client_connection <- socket_connection(client)
# write_ipc_stream(table, client_connection)

