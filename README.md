AirFop Backend
===
This project represents the backend for the AirFop project. 


## Getting Started

This project is built using `Ruby on Rails`, which is a web framework that is built using `Ruby`. You'll need both of 
these installed before you can run the project. To reduce compatibility issues, you'll probably want to install the 
latest major releases of the programs that was used to build this project, which are `Ruby v2.7.2` and 
`Ruby on Rails v6.0.3.4`. 

You may already have these installed on your computer, but you can use this link 
[link](https://gorails.com/setup/osx/10.15-catalina) to install the software if you don't. 

This project was tested running MacOS Catalina and it should run across all *nix devices. There may be some issues 
running on different operating systems, but none are known of at the time of this writing. 

## Starting the Project

1. run `bundle install` to install all the dependencies.
1. Install the SQLITE3 Database. There are may tutorials out there for your OS.
1. run `rails db:create` to create the development and test databases. At the moment, we are using the SQLITE3 database.
1. run `rails db:migrate` to run all the database migrations.
1. run `rails server` to start the server. The server runs on `localhost:3000`, so make sure that port is available. 

Remember, this project is just the **backend** - you're not going to be seeing webpages from this project; only JSON. 
This JSON is meant to be consumed by the front-end project 
[AirFop-Dasboard](https://github.com/MLH-Fellowship/AirFop-Dasboard).

## Documentation

For documentation about all the HTTP requests, go to this 
[link](https://github.com/MLH-Fellowship/AirFop-Backend/tree/master/docs).

## What's left to be done
