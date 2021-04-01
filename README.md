# Travel Destination Reviews API
#### **Authors: Andy Lawson, Jo Miller, Zack Rutledge**
* * *

## Description

A travel destination API that includes a list of destinations and corresponding reviews. A user can make API calls to get a random destination, or search, create, update, and delete destinations and reviews.

## Technologies used

* Bootstrap
* Bundler
* FactoryBot
* Faker
* git
* HTML
* PostgreSQL
* Rspec
* Ruby on Rails
* Swagger-Docs

* * *

## Authentication

This service requires no authentication to use. **CORS**! YES! YOU NEED IT, WE GOT IT!

## Demo API

To Demo this API, follow the installation instructions listed below and navigate to http://localhost:3000/index.html in your browser. \
There you can live demo the following API calls:

**_Note: To search destination by country, state, or city, search params must be lowercase_**

 Action |  Route | Description
| :--- | --- | ---: |
| <span style="color:blue">Get</span> | /random | _Fetches a random destination_ |
| <span style="color:blue">Get</span> | /destinations | _Fetches all destinations_ |
| <span style="color:blue">Get</span> | /destinations?country={country} | _Fetches destinations that match a country_ |
| <span style="color:blue">Get</span> | /destinations?state={state} | _Fetches destinations that match a state_ |
| <span style="color:blue">Get</span> | /destinations?city={city} | _Fetches destinations that match a city_ |
| <span style="color:green">Post</span> | /destinations | _Creates a destination_ |
| <span style="color:red">Delete</span> | /destinations/{destination_id} | _Deletes a destination_ |
| <span style="color:blue">Get</span> | /destinations/{destination_id} | _Fetches a single destination_ |
| <span style="color:gold">Patch</span> | /destinations/{destination_id} | _Updates a single destination_ |
| <span style="color:blue">Get</span> | /destinations/{destination_id}/reviews | _Fetches all reviews for a destination_ |
| <span style="color:green">Post</span> | /destinations/{destination_id}/reviews | _Creates a review for a destination_     |
| <span style="color:red">Delete</span> | /destinations/{destination_id}/reviews/{review_id} | _Deletes a review for a destination_ |
| <span style="color:blue">Get</span> | /destinations/{destination_id}/reviews/{review_id} | _Fetches a single review for a destination_ |
| <span style="color:gold">Patch</span> | /destinations/{destination_id}/reviews/{review_id} | _Updates a single review for a destination_ |

## Responses & Errors

* 404 - Not Found \
  **{ "message": "Couldn't find Destination with 'id'=  " }**
* 422 - Unprocessable Entity \
  **{ "message": "Validation failed" }**
* 500 - Internal Server Error \
  **{ "error": "Internal Server Error" }**

* * *
## Schema

<img src="./public/images/api-schema.png" alt="Image of schema.">
* * *
## Software Requirements
* **Ruby is required to run this application**
* **PostgreSQL is required to run the database**

 <a href="https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-ruby">Ruby download instructions</a>
  <a href="https://www.learnhowtoprogram.com/ruby-and-rails/getting-started-with-ruby/installing-postgres">PosgreSQL download instructions</a>

## Installation Instructions
1. Navigate to the desired directory where you would like to clone the project to.

2. Once you have chosen your desired directory, clone the github repo using the version control tool `git` (<a href="https://www.learnhowtoprogram.com/introduction-to-programming/getting-started-with-intro-to-programming/git-and-github">download instructions</a>). Typing the following command into your terminal:
```bash
$ git clone https://github.com/andyL89/travel_api.git
```
3. Open the project in VSCode by typing the following in your terminal:

``` bash
$ code .
```
* Note: VSCode is a code editing software. If you don't already have it, you can download it <a href="https://code.visualstudio.com/">here</a>

4. While located in the root directy, install gem bundler by typing:

``` bash
$ gem install bundler
```

5. Install gem bundles by typing:

``` bash
$ bundle install
```

6. Create a database for this project by typing the following into your terminal while located in the root directory:
```
$ rake db:setup
```

7. Seed the database with supplementary data:
```
$ rake db:seed
```

8. Prepare API documentation to view in browser:
```
$ rake swagger:docs
```

The database should now be correctly set up. And you may start a local server to interact with the project.

9. To start a local server, open your default browser and type "localhost:3000" into the search bar and press enter. Here, you will see the live server.

## Running Tests
* This application was created using test-driven development (TDD).
* To run the tests yourself, follow the steps below.

Simply type "rspec" into your terminal while located in the root directory of the project.
``` bash
$ rspec
```
* * *

## License
> [GPLv3](https://choosealicense.com/licenses/gpl-3.0/)\
> Andy Lawson &copy; 2021 <br>
> Zack Rutledge &copy; 2021 <br>
> Jo Miller &copy; 2021

* * *

## Contact Information

Reach Andy via <a href="https://www.linkedin.com/in/andrew-lawson-dev/" target="_blank">Linkedin</a> or <a href="alawson89@gmail.com" target="_blank">email</a></li>.

Reach Zack via <a href="https://www.linkedin.com/in/zack-rutledge762/" target="_blank">Linkedin</a> or <a href="thorgrim88@gmail.com" target="_blank">email</a></li>.

Reach Jo via <a href="https://www.linkedin.com/in/jomillerde/" target="_blank">Linkedin</a> or <a href="joannadawnmiller@gmail.com" target="_blank">email</a></li>.