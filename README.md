Description

 This project is intent to display the Dog data list in CustomTableview Cell. Coredata is used to store the data of DogName,OwnerName along with Description of the Dog and Photo.To upload a photo you can use from Photo library or Camera to select the photo to save it in database.

Requirements

  1.This project met all the requirements which mentioned below in the Acceptance Criteria.
  
  2.A user should be able to create a dog, entering the dog's name, a description of the dog, and a photo of the dog

  3.The newly created dog should display in a list of all dogs with their description

  4.Each dog in the list should show their name, a thumbnail photo and the description

  5.When a dog is selected, display a popup that shows:
    The dog's name
     A description of the dog
     A larger version of the dog's photo
     Use Core Data as the persistent store.

  6.Minimum API target should be iOS 10+

Cocoapods

  In this project used Reveal to inspect runtime view debugging. To get the Reveal in your application add the below line in your pod file.
  
   pod 'Reveal-SDK', :configurations => ['Debug']
