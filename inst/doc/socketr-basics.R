## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----tcp-loopback, eval=FALSE-------------------------------------------------
# library(socketR)
# 
# local({
#   server <- socket_create("inet", "stream")
#   client <- socket_create("inet", "stream")
#   peer <- NULL
# 
#   on.exit({
#     if (!is.null(peer) && socket_is_open(peer)) socket_close(peer)
#     if (socket_is_open(client)) socket_close(client)
#     if (socket_is_open(server)) socket_close(server)
#   }, add = TRUE)
# 
#   socket_reuse_address(server, TRUE)
#   socket_bind(server, "127.0.0.1", 0L)
#   port <- socket_local_name(server)$port
#   socket_listen(server)
# 
#   socket_connect(client, "127.0.0.1", port)
#   peer <- socket_accept(server)
# 
#   socket_send(client, "hello from R")
#   socket_poll(peer, "read", timeout_ms = 1000L)
#   message <- rawToChar(socket_receive(peer, n = 12L))
#   message
# })

## ----tcp-auto, eval=FALSE-----------------------------------------------------
# library(socketR)
# 
# server <- socket_listen_auto(port = 0L)
# client <- socket_connect_auto(server$address, server$port)
# peer <- socket_accept(server)
# 
# socket_send(client, "hello from auto-connect")
# socket_poll(peer, "read", timeout_ms = 1000L)
# rawToChar(socket_receive(peer, n = 23L))
# 
# socket_close(peer)
# socket_close(client)
# socket_close(server)

## ----unix-domain, eval=FALSE--------------------------------------------------
# library(socketR)
# 
# path <- tempfile("socketr-")
# server <- socket_create("unix", "stream")
# client <- socket_create("unix", "stream")
# peer <- NULL
# 
# on.exit({
#   if (!is.null(peer) && socket_is_open(peer)) socket_close(peer)
#   if (socket_is_open(client)) socket_close(client)
#   if (socket_is_open(server)) socket_close(server)
#   if (file.exists(path)) unlink(path)
# }, add = TRUE)
# 
# socket_bind(server, path)
# socket_listen(server)
# socket_connect(client, path)
# peer <- socket_accept(server)
# 
# socket_send(client, "hello over Unix")
# socket_poll(peer, "read", timeout_ms = 1000L)
# rawToChar(socket_receive(peer, n = 15L))

