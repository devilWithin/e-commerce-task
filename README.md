### E-Commerce Task

This project is about an E-commerce project that is built with Flutter.

I used clean architecture in this project as the task is about more than one feature in a mega project that is scalable.

So i used clean architecture in order to maintain the project easily and to make it scalable and easy to test.

### Folder Structure:

## Configs folder:
- This folder contains all the configurations of the project routing like the theme, routing.

# Routing:
- Used OnGenerated routes to customize routing animation and as the project gets bigger,
  we should use this method in order to have routing and routing away from main.dart file.

# Theme:
- Used to customize the theme of the project.

## Core folder:
- This folder contains all the core files that are used in the project.

# Error:
- Used to handle all the errors that are used in the project.

# Utils:
- Used to handle all the utils that are used in the project like constants, colors, string
  and asset manager.

# Api: Used to handle all the api calls that are used in the project.
- In the project i did not use any API calls , but there is file named Api consumer,
  this is basically an interface to be implemented using any API package like Dio or Http.
- End points class to contain the domainBaseUrl and all the end points.
- Status Code class used in Dio Consumer.
- Dio Consumer is a implementation class of Api Consumer.
- Base UseCase is a base class for use cases in order not to write boilerplate code in each use case.

# Widgets:
- Used to handle all the widgets that are used in the project like custom text field, custom button.


# Injection Container:
- Used to handle all the dependency injection in the project using get_it








