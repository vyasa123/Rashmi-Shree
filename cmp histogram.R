str(Salary_Data)


#Descriptive statistics

summary(Salary_Data)

hist(Salary_Data$YearsExperience, col=rainbow(7))

hist(Salary_Data$Salary, col=rainbow(7))

plot(Salary_Data$YearsExperience,
    Salary_Data$Salary, col=rainbow(7))

cor(Salary_Data)
#Splitting into Train & Validation Data


library(caTools)

set.seed(123)
split=sample.split(Y=Salary_Data$Salary,
                   SplitRatio = 0.75)

training_set = subset(Salary_Data,split == TRUE)

validation_set =subset(Salary_Data,
                       split== FALSE)

#Building Linear Regression Model on training

regression_model = lm(formula=Salary~YearsExperience,data=training_set)

summary(regression_model)

# Predicting the Test set results

y_pred =predict(regression_model,
                newdata = validation_set)

print(y_pred)

print(cbind(validation_set$Salary,
            y_pred,
            validation_set$Salary-y_pred))

hist(y_pred,
     col= rainbow(7))
hist(y_pred,
     col= 'red')


library(rattle)
rattle()









