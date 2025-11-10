# =============================================================
# In-Class Assignment — Multiple Linear Regression 
# DSS 445: R Statistical Programming Language 
# Prof. Jarrett C. Hurms — Fall 2025 
# =============================================================
# Clear environment rm(list = ls()) graphics.off() # Load readxl library(readxl)
# Read Excel file warehouse <- read_excel("YOUR FILEPATH HERE")
# View first few rows and summary
rm(list = ls())
graphics.off()
library(readxl)

warehouse <- read_excel("C:/Users/bibly/OneDrive/Desktop/R SJU Practice/warehouse_fulfillment_operations.xlsx")
head(warehouse)
summary(warehouse)

#2
a <- lm(FulfillmentTimeMin ~ Orders + StaffOnShift + AvgItemsPerOrder +
               RushOrdersPct + Automation + Shift, data = warehouse)
summary(a)

coef(a)["StaffOnShift"]
coef(a)["ShiftNight"]

#4
b <- lm(FulfillmentTimeMin ~ Orders * Automation + StaffOnShift +
                AvgItemsPerOrder + RushOrdersPct + Shift, data = warehouse)
summary(b)

summary(b)$coefficients["Orders:AutomationYes", ]

#5
plot(cut(warehouse$Orders, 3, labels = c("Low", "Medium", "High")),
     warehouse$FulfillmentTimeMin,
     main = "Orders (Low, Medium, High) vs. Fulfillment Time",
     xlab = "Order Level",
     ylab = "Fulfillment Time (minutes)",
     col = c("darkblue", "darkgreen", "red"))












