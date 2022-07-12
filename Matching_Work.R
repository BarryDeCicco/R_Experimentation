####    Load Libraries    ####

library(lubridate)
library(magrittr)
library(sqldf)
library(tidyverse)

####     Set up Data    ####
Months <- month.name
View(Months)
Volume <-  c("a", "b", "c" ,"d" ,"e", "f", "g", "h", "i", "j" ,"k", "l")
View(Volume)

Month_Year <- seq(ymd('2020-01-01'),ymd('2020-12-31'),by='month')
View(Month_Year)


df1 <- as.data.frame(cbind(format(as.Date(Month_Year),"%Y-%m-%d"), Volume))
View(df1)

Case_Count <- c(runif(24,1,99))
Level_of_Care <- c(rep("ICU",12),rep("Acute",12))

df2 <- as.data.frame(cbind(Months, Case_Count))
View(df2)

df2 <- df2 %>% 
  dplyr::filter(!Months == "June")
View(df2)


####     Start Matching    ####


####     Dplyr joins       ####

  
left_join_dplyr_df <- dplyr::left_join(df1, df2, by = "Months" )
View(left_join_dplyr_df)



right_join_dplyr_df <- dplyr::right_join(df1, df2, by = "Months" )
View(right_join_dplyr_df)


inner_join_dplyr_df <- dplyr::inner_join(df1, df2, by = "Months")
View(inner_join_dplyr_df)


full_join_dplyr_df <- dplyr::full_join(df1, df2, by = "Months")
View(full_join_dplyr_df)

####     sqldf joins       ####

sql_left_join_df <- sqldf("select * from df1 a left join df2 b where a.Months = b.Months")
View(sql_left_join_df)

sql_full_join_df <- sqldf("select * from df1 a full outer join df2 b on a.Months = b.Months")
View(sql_full_join_df)


####     Base R merge joins       ####
####     
####     

merge_all_x_df <- merge(df1, df2, by="Months", all.x = TRUE)
View(merge_all_x_df)


####   Simple expansion              ####


  
####   Grid expansion                          ####

                            
