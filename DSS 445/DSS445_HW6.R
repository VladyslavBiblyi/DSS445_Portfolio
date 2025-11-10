rm(list = ls())
graphics.off()
library(readxl)

hospit_staff <- read_excel("C:/Users/bibly/OneDrive/Desktop/R SJU Practice/hospital_staffing_satisfaction.xlsx")
head(hospit_staff)
summary(hospit_staff)

#2
a <- lm(SatisfactionScore ~ PatientsSeen + AvgWaitTime + NursesOnShift + 
          DoctorsOnShift + Weekend + EmergencyLevel, data = hospit_staff)
summary(a)

coef(a)["PatientsSeen"]     
coef(a)["Weekend"]  


#3
b <- lm(SatisfactionScore ~ PatientsSeen + AvgWaitTime + NursesOnShift + 
          Weekend + EmergencyLevel, data = hospit_staff)
summary(b)

#4
c <- lm(SatisfactionScore ~ PatientsSeen + AvgWaitTime + NursesOnShift * Weekend + 
          EmergencyLevel, data = hospit_staff)
summary(c)


summary(c)$coefficients["NursesOnShift:WeekendYes", ]


#5
boxplot(SatisfactionScore ~ cut(hospit_staff$NursesOnShift, 3,
                                labels = c("Low", "Medium", "High")) + Weekend,
        data = hospit_staff,
        main = "Nurses*Weekend vs. Satisfaction",
        xlab = "Nurses*Weekend",
        ylab = "Satisfaction",
        col = c("darkblue", "darkgreen", "red", "yellow", "orange", "purple"))

        



