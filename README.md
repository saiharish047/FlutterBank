# bank

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Flutter Project Design Pattern

## Clean architecture with Bloc

## Bloc parent

## all blocs will extend this.

## Bloc, state and event -> For state management

## Page -> Main view , 

1) Create attrs in Bloc and supply them through state

2) Create attrs in page and pass it to the widget and based on state type manage it

## Widgets  -> All common and small widgets

## Navigation Handler -> 
    instantiate in page itself and use the object tocall functions.

## Content provider -> This will be a common file. Which will be initialised at the start.
    common content for entire project.

## We will build content attributes in page.
    

## in page we will create DI instances of navigation handler and all content and generate attributes, 

## Bloc will API calls

## viewmodel code and 

## Domain -> model and mapper, the usecase

## Data -> API call logic