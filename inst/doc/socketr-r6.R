## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----r6-tcp, eval=FALSE-------------------------------------------------------
# library(socketR)
# 
# server <- Socket$new("inet", "stream")
# client <- Socket$new("inet", "stream")
# peer <- NULL
# 
# on.exit({
#   if (!is.null(peer)) peer$close()
#   client$close()
#   server$close()
# }, add = TRUE)
# 
# server$set_option("socket", "reuseaddr", TRUE, "logical")
# server$bind("127.0.0.1", 0L)
# server$listen()
# 
# client$connect("127.0.0.1", server$local_name()$port)
# peer <- server$accept()
# 
# client$send("hello from the R6 API")
# peer$poll("read", timeout_ms = 1000L)
# rawToChar(peer$receive(n = 21L))

## ----r6-options, eval=FALSE---------------------------------------------------
# client$info()
# client$fd()
# client$set_blocking(FALSE)
# client$get_option("socket", "keepalive", "logical")
# client$set_options(list(
#   list(level = "socket", option = "keepalive",
#        value = TRUE, type = "logical"),
#   list(level = "tcp", option = "nodelay",
#        value = TRUE, type = "logical")
# ))

## ----r6-connection, eval=FALSE------------------------------------------------
# connection <- client$as_connection()
# writeBin(charToRaw("bytes through an R connection"), connection)
# close(connection)
# client$close()

