#Rails API for a Todo List

This is an API for a Todo List written using Ruby and Rails. This will connect to an Angular Todo application that I previously built using Firebase. 

This API is currently on Heroku [https://v1api.herokuapp.com/api/](https://v1api.herokuapp.com/api/). To run the application, simply go to `users/1`, which will allow you to access the application. When you get a prompt for a username and password, type `alger` and `hello`, respectively. 

The best way to access the API is through cURL. 

- The route for lists is `users/:user_id/lists`, which provides all the lists and you can add a list here. 
- To delete or update lists, use `users/:user_id/lists/:id`.
- To view items, go to `lists/:list_id/items`, which provides you with the items and you can add your own here.
- To delete or update items, use `lists/:list_id/items/:id`.

##Cloning

To clone the project, type 

`git clone https://github.com/AbdullahAlger/rails-api`

Modifications to the project are underway. I am developing a [front end for the project using Angular](https://github.com/AbdullahAlger/angular-rails-api-frontend). It should be finished shortly. 

Have fun playing with it!