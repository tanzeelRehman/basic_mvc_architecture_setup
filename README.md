# MVC ARCHITECTURE WITH GETX FLUTTER

MVC Architecture implementation with extended functionalities 

## Architecture Details
Inside lib, we have 2 main folders

- Core
- Features
- Dependency Container

## Core folder
This folder contains code that will be used globally inside your application
- API (interceptors added for your API calls, I am using Dio for APIs)
- Constants (All the constant data)
- error (Exception classes, when API will return error API call will be delegated to exception class and here we have different error messages for different error codes)
- global (global keys)
- helpers (helper methods for example validators/extensions)
- network (This class contains info about the network connection. You can use this class method to check for internet in your API calls)
- Theme (Define dark and light theme here)
- Widgets (Add globle widgets here)

## Features
Breakdown your app into Seperate features
A single features contains following folders
- Model (data modals for this features)
- View (Contain screens and widgets for this feature)
- Controller (Buisness logic for this feature
- Data (Add API calls of this feature, controller will communicate with data and data will return the result and based upon this result UI will be changed) 

## Dependency Container
this is lazy singelton calss and contains all the instances which will be used in the entire app. 
  


