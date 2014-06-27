## Load the Train data
message('Loading the data In X_train.txt DataSet')
data.train <- read.csv('UCI HAR Dataset/train/X_train.txt', header = F, sep = '' )
message('Loading the data In y_train.txt DataSet')
data.train.y <- read.table('UCI HAR Dataset/train/y_train.txt')

names(data.train.y) <- 'y'
message('Merge X_train and y_train DataSets')
data.train <- cbind(data.train, data.train.y)

## Load the Test Data
message('Loading the data In X_test.txt DataSet')
data.test <- read.csv('UCI HAR Dataset/test/X_test.txt', header = F, sep = '' )

message('Loading the data In y_test.txt DataSet')
data.test.y <- read.table('UCI HAR Dataset/test/y_test.txt')
names(data.test.y) <- 'y'

message('Merge X_test and y_test DataSets')
data.test <- cbind(data.test, data.test.y)

## Combines the test and training set to data variable
message('Combine Both Datasets')
data <- rbind(data.train, data.test)


## Load the features names
message('Loading the Fratures names In features.txt file.')
data.train.features <- read.csv('UCI HAR Dataset/features.txt', header = F, sep = '', stringsAsFactors = F )
message('Renames the DataSet's Features)
names(data) <- c(data.train.features$V2, 'Activity')
names(data)

## remove the unused variables
rm(data.train.features, data.test, data.train, data.train.y, data.test.y)

## search for mean() and std() in the names
RE <- '([A-Za-z]+-(mean|std)..-[A-Za-z])|Activity'
message('Removes the Columns thats are irrelevants')
data.p3 <- data[,grep(RE, names(data))]
names(data.p3)

## remove the unused variables
rm(data, RE)

## change the activity names:
## cast the "Activity" column to a Factor.
data.p3$Activity <- as.factor(data.p3$Activity)
## loads the activities from "activity_labels.txt"
message('Rename the Activity Rows.')
data.activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
levels(data.p3$Activity) <- data.activities$V2

## remove unused variables
rm(data.activities)

cleanNames <- function( names){
  names <- gsub('\\(\\)', '', names)
  names <- gsub('-','_', names)
  names <- sub( 'Acc', 'Acc_', names)
  names <- sub( 'Gyro', 'Gyro_', names)
  names <- sub('Body', '_Body_', names)
  names <- sub('Gravity', '_Gravity_', names)
  names <- gsub('__', '_', names)
  return( names)
}

message('Make Clear the names of the features.')
names(data.p3) <- cleanNames(names(data.p3)); 

message('Save the Tidy DataSet to tidyData.txt')
write.table(x = data.p3, file = 'tidyData.txt', append = F, sep = '\t')


