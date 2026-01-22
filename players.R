library(httr)
library(jsonlite)

url <- "https://www.pff.com/api/college/big_board?season=2026&version=3"

res <- GET(url, add_headers(
  `User-Agent` = "Mozilla/5.0"
))

data <- fromJSON(content(res, "text", encoding = "UTF-8"))

players <- data$players

df <- data.frame(
  name = players$name,
  position = players$position,
  team = players$college,
  rank = players$pff_rank
)

write.csv(df, "data/players.csv", row.names = FALSE)