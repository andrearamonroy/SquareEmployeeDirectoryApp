# SquareEmployeeDirectoryApp

## Build tools & versions used
Xcode 14.2 Swift 5.

Focused on iPhone development, tested with iOS 16.1 iPhone 14 pro, however, it supports older versions such as iPhone SE (3rd generation).

##Frameworks
SwiftUI, Combine

## What areas of the app did you focus on?
* Implementing an MVVM architecture. 
* Implementing a generic data service.
* Caching images. 
* Handling erros.
* Returning an EmptyView() for malformed employees, and an empty employee list.
* Pull-down to refresh.
* Getting familiar with unit tests and implementing them.

I am particularly proud of the EmployeeModelDataService, the PhotoModelCacheManager, the EmployeePhotoViewModel, and learning and implementing unit tests.

## What was the reason for your focus? What problems were you trying to solve?
I chose to focus on implementing the MVVM architecture since it helps organize the code, using folders makes the project easier to navigate. Also, the project is easier to maintain, and it's easier for other developers to add features.  
Also, the I used the Combine framework to implement a generic data service and subscribe the EmployeeViewModel to it rather than having a method to downloadData specific to the EmployeeViewModel that's not reusable. 
Futhermore, I cache the images rather than saving it to the fileManager. 

## Did you make any trade-offs for this project? What would you have done differently with more time?
If I had more time to work on this project I would like to implement more unit tests. 
The take-home project intruduced me to unit tests which are extremely important. 
I found a great resource (a pdf book) on how to conduct unit tests and best practices, that I plan to read and learn more about unit test.
Therefore, next time I will spend less time understading unit tests, and more time implementing them.

## What do you think is the weakest part of your project?
I would have liked to implement more unit tests. I wanted to implement a mockURLSession to test the EmployeeModelDataService and test the ViewModels. 
However, I plan to continue learning and reading more about unit tests to be able to implement them in the future.

## Is there any other information you’d like us to know?
I would like to implement more unit test for the project. However, I am proud of the unit test I did implement in this project. I managed my time in order to research and implement unit tests. I believe next time I am ask to implement unit tests I will be able to provide more test coverage in my projects. 
