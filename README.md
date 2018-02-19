# Badi Coding Challenge Submission - Bassem Mawhoob
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
My name Grizzly Bow and I am a humozombotic scientist specializing in micro-genetic transformation (atleast, that's what they told me in college). I was anonymously informed that the world need my expertise to defend or destroy it, not sure yet. That's why I decided to invade the world with my latest creation, Zombie 1.0.3.1a. Below you'll find my secrets on how this marvelous creation took place. http://badi-bmaw.herokuapp.com/

## Documentation & Usage
* A full documentation of the project's API along with a complete set of example requests for this project are at https://documenter.getpostman.com/view/3752258/badi-backend-challenge/RVfyBpWs

## Technical Discussion
* The project's core is single controller for the Zombie resource with 2 concerns that are heavily used accross the controller. The project depended on RSpec (I find it more expressive) and factories for testing and has been deployed to Heroku. 
* Tests first... always. Generating controllers by default generates controller specs. However, no controller specs have been written during this project. Request specs were used instead. Request specs are designed to drive behavior through the full stack, including routing. This means they can hit the applications' HTTP endpoints as opposed to controller specs which call methods directly. Since this is an an API application, this is exactly the kind of behavior I wanted for my tests.
* No form of rate limitations or security measures have been taken for demonstration purposes only.
* Strong parameters and scopes have been used everywhere to maintain data integrity and search validity.
* The project had little choices to be made but feel free to ask about anything related.

**Cheers :beers:**

