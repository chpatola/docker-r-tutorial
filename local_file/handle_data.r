print(paste("Path is ",getwd()))

library(dplyr)
library(lubridate)

print("Libraries loaded")

# Create tutorial data ----------------------------------------------------

orders_raw <- tribble(
  ~client_name, ~ product_code,~ order_date,
  "v",   5, "2021-12-30",
  "w",   10, "2021-12-03",
  "x",   15, "2021-12-20",
  "y",   20, "2021-12-30",
  "z",   25, "2021-12-09",
  "v",   5, "2021-12-11",
  "w",   5, "2021-12-17",
  "x",   15, "2021-12-30",
  "y",   20, "2022-12-30",
  "z",   5, "2022-01-30",
  "v",   25, "2022-01-05",
  "w",   10, "2022-01-23",
  "x",   15, "2022-01-17",
  "y",   15, "2022-01-03",
  "z",   10, "2022-01-23",
  "v",   25, "2022-01-05",
  "w",   25, "2022-01-23",
  "x",   15, "2022-02-17",
  "y",   10, "2022-02-03",
  "z",   15, "2022-02-23",
  
)


# Handle the data ---------------------------------------------------------

orders_last_month <- orders_raw %>%
  mutate(order_date = as.Date(order_date)) %>%
  filter(
    order_date < floor_date(today(), unit = "months"),
    order_date >= floor_date(today() - months(1), unit = "months")
  )

print("Data is wrangled")

# Save the output data locally to csv --------------------------------------

file_path = '/usr/src/orders/output/orders_last_month.csv'

write.csv(orders_last_month,
          file_path,
          row.names = FALSE)

print("csv is written")
