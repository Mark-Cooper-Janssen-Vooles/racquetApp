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

* Purpose: 
To create a centralised location for users to buy and sell tennis racquets online, thus lowering the cost and barrier to entry for the sport. 

* Functionality / features: 
Postgresql database
Devise user functionality
Authorisations for users
AWS image uploading
Stripe payments API
Searching / sorting / filtering capacity
Google maps API
Admin dashboard
Internal messaging system between users (if there is time)

* Sitemap:
![Sitemap](/docs/sitemap_racquetapp.png "Sitemap")

* Screenshots: 
![Screenshot](/docs/screenshot1.png "Screenshot")
![Screenshot](/docs/screenshot2.png "Screenshot")
![Screenshot](/docs/user_show1.png "Screenshot")
![Screenshot](/docs/favourites.png "Screenshot")

* Target Audience: 
(add more info)
Tennis players or classic racquet collectors

* Tech stack:
HTML
CSS
Ruby
Ruby on Rails
Postgresql
AWS
Stripe
Google maps
Heroku

---

### R12

User stories for your app

---

(do a buyer and seller story!!)

Upon landing on the site, an unregistered user can view racquets that have been listed for sale. They will be able to enter various search paramaters to filter what is displayed below. The home page will display racquet "cards" styled to show the photo of the racquet, the price and the state. 

From here they can view the individual racquet to see more detailed information, such as the specifications, the description of the racquet, and more information about the location, including google map API information. 

If the user clicks on "buy racquet", they will be taken to the login or signup page. From here the user will enter certain information about themselves and create an account. With an account, the user can either list a racquet to sell or buy a racquet. 

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

(expalin here)

---

### R16

Detail any third party services that your app will use

---

(detail here)

---

### R17

Describe your projects models in terms of the relationships (active record associations) they have with each other

---

(describe here)

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

    @racquet = Racquet.find(racquet_id)
    @user = User.find(user_id)

    @racquet.status.sold = true
    @racquet.status.buyer_user_id_id = @user.id
    @racquet.save

Doesn't work but this does work: 

    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId])

    the_racquet = Status.where("racquet_id = '#{@racquet.id}'")[0]

    the_racquet.sold = true
    the_racquet.buyer_user_id_id = @user.id
    the_racquet.save


    The reason seems to be because of the nested call: first we go to the racquet instance, then the status instance, then try to change the sold and save. Rails says it solves in the console, but upon exiting and starting again it hasn't saved. 

    However if we go only one call deep, i.e. just the status (shown above with the .where search), and set the sold to true, it works.

    - geocoder timing out needed initializer file for when internet is slow