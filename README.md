# E-Commerce Task

This project is about an E-commerce project that is built with Flutter.

I used clean architecture in this project as the task is about more than one feature in a mega project that is scalable.

So i used clean architecture in order to maintain the project easily and to make it scalable and easy to test.

# Folder Structure:

## Configs folder:
- This folder contains all the configurations of the project routing like the theme, routing.

### Routing:
- Used OnGenerated routes to customize routing animation and as the project gets bigger,
  we should use this method in order to have routing and routing away from main.dart file.

### Theme:
- Used to customize the theme of the project.
- There is a file which is styles_manager.dart that contains all the styles of the project
- with extensions based on BuildContext.

## Core folder:
- This folder contains all the core files that are used in the project.

### Error:
- Used to handle all the errors that are used in the project.

### Utils:
- Used to handle all the utils that are used in the project like constants, colors, string
  and asset manager.
- Base State file is a Generic class i developed to be used with Cubit or BloC events.
- When calling APIs and using Cubit or Bloc for state management, we always write our state classes
- to refer to the state of the screen, like loading, success, error, etc.
- So i created this class to be used with Cubit or Bloc events to avoid writing the same boilerplate code
  in each Cubit or Bloc event.

### Api: Used to handle all the api calls that are used in the project.
- In the project i did not use any API calls , but there is file named Api consumer,
  this is basically an interface to be implemented using any API package like Dio or Http.
- End points class to contain the domainBaseUrl and all the end points.
- Status Code class used in Dio Consumer.
- Dio Consumer is a implementation class of Api Consumer.
- Base UseCase is a base class for use cases in order not to write boilerplate code in each use case.

### local_db:
- Used to handle all the local database that are used in the project.
- Currently using Hive for storing data locally and it's used in getProducts in products_repository_impl.dart.
- Hive is lightweight and fast key-value database that is used in the project.
- Used this approach to demonstrate SSOT (Single Source of Truth) in the project.

### Widgets:
- Used to handle all the widgets that are used in the project like custom text field, custom button.
- Also i have the mind set of creating generic classes to be used in many parts of the project like
- custom_radio_list_tile.dart, custom_checkbox_drop_down, custom_drop_down_menu.


### Injection Container:
- Used to handle all the dependency injection in the project using get_it

## Features folder:
- This folder contains all the features that are used in the project.
- Each feature contains the following:
  - Presentation: Contains all the UI of the feature.
  - Domain: Contains all the business logic of the feature.
  - Data: Contains all the data that are used in the feature like repositories, models, data sources.








