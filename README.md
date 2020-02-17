# bg-backend-assignment
Blueground backend assignment for the purposes of interviewing

## BlueMars
This project consists of a backend and a frontend. The backend is a REST API app built with Ruby On Rails. It uses mySql database. 
The frontend is implemented in Vue.js using axios for API consumption.

### Objectives
* API should allow for infinite scroll to be implemented in the browser
* Allow searching for units based on title or region and sorting by score
* Allow user to post reviews on a specific unit by adding a score from 1 to 5 stars along with
an optional comment
* Allow users to authenticate using a ​ username/password
* Allow users to authorize against the API using ​ JWT​ based authorization

## Backend

### Routes
`post 'http://localhost:3000/auth?username=<username>&&password=<password> ' ` to authenticate user against database.
The response is in json format containing the JWT token and the expiration date.

`get 'http://localhost:3000/units'` to get all available units. The response is in json format, returning an array of units. Units are paginated 
in batches of 15 units per page. The json contains the current page and total pages in a meta array.

`get 'http://localhost:3000/units?page=XX'` to get all units in page XX.

`get 'http://localhost:3000/units?sort=<score>' it sorts all units based on score.

`get 'http://localhost:3000/unit/:id/reviews'` to get the details of the unit with id = :id and the reviews that are posted in this unit.

`post 'http://localhost:3000/unit/:id/reviews?score=<X>&&body=<review>&&user_id=<XX>'` to create a new review under the current Unit.

`'get 'http://localhost:3000/search?title=<title>&&region=<region>'` to make a database search `SELECT "units".* FROM "units" WHERE (title = 'unit4' or region= 'place')` return 
a json with the selected units.


### Testing

In BlueMarsRoRAPI/spec I have defined testcases for users and units. To execute them do:

`$bundle exec rspec`

## Frontend

In order to consume the Rails REST API I use vue.js.

### Components

* Login
This component has a form for logging in, using the JWT auth token to authenticate the user, storing it in localStorage.

* Units
This component shows the Units. Scrolling down loads more units implementing the infinite score.

* Reviews
This component shows the detail of the unit, along with the reviews that are made to this unit.

----------------------------------------------------
This project is build using Ubuntu 18.04.

Backend queries are tested in Postman and Frontend is developed using Bootstrap, tested in Mozilla Firefox
