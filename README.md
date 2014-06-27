How to run this script Step by Step
----------------------------------------------------------------------

* You need to clone this repo.
* Download the [DataSet](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
  + Go to your Working Directory
  + Unzip the file
  + Make Sure that the name of the folder is `UCI HAR Dataset`
* Run the script `run_analysis.R` from RStudio or R console
* A new File, named `tidyData.txt` should be in your Working Directory
* The Explanation of each Data in the new DataSet is in the [Code Book]()


The `run_analysis.R` Script
-----

`run_analysis.R` merges many DataSets and produces a big tidy DataSet which may be used for Analysis later.

* First, Load and merge the `X_train.txt` and `X_test.txt` DataSets.
* Load and merge the `y_train.txt` and `y_test.txt` DataSets.
* Renames the Columns of the new DataSet.
* Re-Label the rows of the Activity Column with the apropiate names.
* Remove the extra column. It's remain only the Activity and Which are mean or standard Deviation.
* Save the "Tidy" DataSet in a new File, named `tidyData.txt`














