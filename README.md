Rails project order of operations:
- Entity relationship diagram (lucid chart) (DONE)
- Wire frames - (going to be an eBay clone) - do three and then move on to site map. (figma)(DONE)
- Site map (lucid chart) - (DONE)
- Start making the app! Use trello to go through MVP and Beast (trello) - (CURRENT)
https://trello.com/b/3auvMoX3/railsapp
- When only 3 days left, start styling CSS. User typewriter + styling from portfolio.

- finish off readme
- do slide deck at the very end!

# README

### R7 
Identification of the problem you are trying to solve by building this particular marketplace app.

---

A good tennis racquet is often over $300 to buy new, and often times older models are considered better than the newer racquets but they are no longer sold in retail stores. 

Since wooden racquets became a relic, the newer "modern" players racquet can last 20+ years and generally retain their playability quality. RacquetApp creates a dedicated online environment for the public to buy and sell their tennis racquets.

It caters for a beginner-intermediate player looking to get into the sport by purchasing a quality tennis racquet that isn't super expensive, or an advanced player looking to try out new racquets to up their game.  It also caters for collectors looking to add another classic to their collection.

---

### R8
Why is it a problem that needs solving?

---

The nature of reality is such that man is destined to suffer. As the buddhist philosophy states, the nature of seeking creates discontentment as happiness only occurs in a content, striveless state. Psychologists have labelled "flow" as the ideal state for the human psyche, with the sport of tennis being an exceptional way to enter this state. There is a distinct demand in tennis for second hand racquets but there is no centralised place where this occurs. Currently buyers and sellers have to search the market, checking on websites like ebay and gumtree. A perfect tennis racquet enables this state to be more easily entered, thus this app will aim to elevate society as a whole through the individual. 

---

### R9
A link (URL) to your deployed app (i.e. website)

---

https://racquetapp.herokuapp.com/

---

### R10
A link to your GitHub repository (repo).

---
https://github.com/Mark-Cooper-Janssen-Vooles/racquetApp

---

### R11
Description of your marketplace app (website), including:
Purpose
Functionality / features
Sitemap
Screenshots
Target audience
Tech stack (e.g. html, css, deployment platform, etc)

---

**Purpose:** 
<p>To create a centralised location for users to buy and sell tennis racquets online, thus lowering the cost and barrier to entry for the sport. </p>

**Functionality / features:**
<p>The users can create a profile, message other users, purchase tennis racquets and sell tennis racquets. </p>

* Postgresql database
* Devise user functionality
* Authorisations for users
* AWS image uploading
* Stripe payments API
* Searching / sorting / filtering capacity
* Google maps API
* Admin dashboard
* Internal messaging system between users

**Sitemap:**
![Sitemap](/docs/sitemap_racquetapp.png "Sitemap")
<p>Note: This sitemap was created at the start of the project and has since changed somewhat through development.</p>

**Screenshots:**
![Screenshot](/docs/screenshot1.png "Screenshot")
![Screenshot](/docs/screenshot2.png "Screenshot")
![Screenshot](/docs/user_show1.png "Screenshot")
![Screenshot](/docs/favourites.png "Screenshot")
![Screenshot](/docs/message_1.png "Screenshot")
![Screenshot](/docs/message_2.png "Screenshot")

**Target Audience:**
<p>Tennis players or racquet collectors who are looking to buy a new racquet or sell one of theirs. </p>

**Tech stack:**
- HTML
- CSS
- Ruby
- Ruby on Rails
- Postgresql
- AWS API
- Stripe API
- Google maps API
- Heroku Deployment

<p>Rails gems used: </p>

- Devise
- byebug
- Rspec
- Capybara
- Webdrivers
- Devise
- aws-sdk-s3
- Ransack
- Faker
- kaminari
- bootstrap
- jquery-rails
- Stripe
- Geocoder
- Ausburbs

---

### R12

User stories for your app

---

Upon landing on the site, an unregistered user can view racquets that have been listed for sale. They will be able to enter various search paramaters to filter what is displayed below. The home page displays racquet "cards" styled to show the photo of the racquet, the price and title. There is 5 listings per page and a pagniation feature to display more. The listings are displayed in order of last created. There is a large search bar at the top of the screen, which filters the racquets by description, length, balance, stiffness, string pattern, head size, brand or title.

From here the user can click on a listings photo to view the individual racquets show page to see more detailed information, such as the specifications, the description of the racquet, and more information about the location of the racquet which includes google map API information. When a racquets show page is viewed, the visits count is incremented by one. 

If the user clicks on "buy racquet", they will be taken to the login or signup page. From here the user will enter certain information about themselves and create an account. The first step is to enter an email and password, which is handled by the Devise gem. After this step they are redirected to the "user details" page and required to enter more information about their name, location, a photo and a description. If they choose not to upload a photo, a default picture is chosen. If for some reason the page closes or they enter a different URL, if the user details for the user remains nil then they will be redirected back to the user details page whenever they try to do an action that requires having user details. 

With an account now set up and logged in, the user can either list a racquet to sell or buy a racquet. If the user finds a racuet they wish to purchase, they can go to that racquets show page and click "buy this racquet" and will be taken to the Stripe website to enter their credit card information. Upon successful completion of this, an automatically generated conversation is started between the buyer and the seller in order to set up a pickup time. 

The user can click "My Account" to see their information, to view sales, view purchases, edit their profile, delete their profile and view their racquet listings. At this point clicking "view purchases" will take you to a page which lists all the purchaes they have made. Conversely on the sellers account, if they click "view sales" it will list all the sales they have made and the total amount of money made through those sales. 

If the user sees a racquet they were interested in but are not willing to commit to buying at the current time, they can favourite the racquet which stores it on their favourites page. 

---

### R13

Wireframes for your app

---

https://www.figma.com/file/C3OSXh87tzmNvvCDX6Isgo/RacquetApp?node-id=10%3A0

Home: 
![Home](/docs/home.png "Home")

Product show page: 
![Product show page](/docs/product_show.png "Product show page")

User show page:
![User show page](/docs/user_show.png "User show page")

---

### R14

An ERD for your app

---

https://www.lucidchart.com/documents/edit/d5391265-7e1d-44ac-bf07-e0b5534ee76b/0_0?beaconFlowId=744B23A6A8A8B79E

![ERD](/docs/RacquetApp.png "ERD")

---

### R15 

Explain the different high-level components (abstractions) in your app

---

Active Record is an implementation of the object-relational mapping (ORM) pattern. The active records used by the Racquet app transpile ruby commands like `Racquet.all` to SQL commands like `select * from "Racquet"`. 

Other high-level components used include the form helpers such as `form_with` which is an in-built into Ruby on Rails and helps more easily generate a form, connecting the correct database and get / post (or put/patch) HTTP verbs. 

---

### R16

Detail any third party services that your app will use

---

RacquetApp uses the following third party services:
* The AWS API s3 service to upload images
* Stripe API to accept payments
* Heroku to deploy the website live on the internet
* Google maps API to list the user / racquets location
* Ausburbs which provides data on the states and suburbs in Australia, to validate user entry that the state / suburb exists
* The Geocoder gem which takes the suburb from Ausburb and converts that into coordinates to be used with the google maps API
* The Devise gem, which handles users signing up and authentication that a user is logged in.
* The Byebug gem which was used during development of the app to test for bugs
* The Rspec gem which was used in combination with Capybara
* The Capybara gem, which automates users actions on an app aka "Acceptance testing"
* The Webdrivers gem which is required for Capybara to run on google chrome
* The Ransack gem which is used for the search bar functionality
* The Faker gem which is used in the seeds.rb file to seed the database with fake information for display purposes
* The Kaminari gem which is used to paginate the list of racquets
* The Bootstrap gem which is used to style the pagination from Kaminari

---

### R17

Describe your projects models in terms of the relationships (active record associations) they have with each other

---



---

### R18

Discuss the database relations to be implemented in your application

---

(discuss here)

---

### R19

Provide your database schema design

---

(provide here)
talk about data types and reasoning behind datatypes, i.e. number as a string... didnt need to do maths on it or something. Or using a text over a string (may have more than 255 characters)

---

### R20

Describe the way tasks are allocated and tracked in your project

---

(describe here)

---

### Trello boards

![Trello](/docs/trello1.png "Trello")
![Trello](/docs/trello2.png "Trello")
![Trello](/docs/trello3.png "Trello")
![Trello](/docs/trello4.png "Trello")
![Trello](/docs/trello5.png "Trello")
![Trello](/docs/trello6.png "Trello")
![Trello](/docs/trello7.png "Trello")
![Trello](/docs/trello8.png "Trello")

### Things to talk about in presentation
- General overview
- search partial which displays in all pages, getting @q to work
- pagination gem
- incrementing page views
- delete_duplicates in favourites controller
- seed file
- google API, geocoder gem, generating maps based off of suburb.
- using "Ausburbs" to create a pre-defined list of suburbs and states 
- using Javascript to force entry into input fields to be capitalized 
- Used RSPEC / capybara for TDD for model validations
- talk about rails bug discovery: 
````ruby
    @racquet = Racquet.find(racquet_id)
    @user = User.find(user_id)

    @racquet.status.sold = true
    @racquet.status.buyer_user_id_id = @user.id
    @racquet.save
````

Doesn't work but this does work: 

````ruby
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId])

    the_racquet = Status.where("racquet_id = '#{@racquet.id}'")[0]

    the_racquet.sold = true
    the_racquet.buyer_user_id_id = @user.id
    the_racquet.save
````

    The reason seems to be because of the nested call: first we go to the racquet instance, then the status instance, then try to change the sold and save. Rails says it solves in the console, but upon exiting and starting again it hasn't saved. 

    However if we go only one call deep, i.e. just the status (shown above with the .where search), and set the sold to true, it works.

    - geocoder timing out needed initializer file for when internet is slow
    - geocoder server going down and needing an if statement when it returns nil
    - deleting user_details also needs to delete user, racquet, racquet status and location ... needed to manually delete status of racquet and racquet in user_details delete method with a loop:

````ruby
    User.find(@user_detail.user_id).racquets.each do |racquet|
        racquet.status.destroy
      end
      User.find(@user_detail.user_id).racquets.destroy_all
````