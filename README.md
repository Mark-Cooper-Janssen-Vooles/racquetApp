- Redo site map to reflect current design
- Redo ERD thing to reflect current design
- Do more figma drawings?!
- do slide deck at the very end!

# README

### R7 
Identification of the problem you are trying to solve by building this particular marketplace app.

---

A good tennis racquet is often over $300 to buy new, and often times older models are considered better than the newer racquets but they are no longer sold in retail stores. 

Since wooden racquets became a relic, the newer "modern" players racquet can last 20+ years and generally retain their play-ability quality. RacquetApp creates a dedicated online environment for the public to buy and sell their tennis racquets.

It caters for a beginner-intermediate player looking to get into the sport by purchasing a quality tennis racquet that isn't super expensive, or an advanced player looking to try out new racquets to up their game.  It also caters for collectors looking to add another classic to their collection.

---

### R8
Why is it a problem that needs solving?

---

The nature of reality is such that man is destined to suffer. As the Buddhist philosophy states, the nature of seeking creates discontentment as happiness only occurs in a content, desire-less state. Psychologists have labelled "flow" as the ideal state for the human psyche, with the sport of tennis being an exceptional way to enter this state. There is a distinct demand in tennis for second hand racquets but there is no centralised place where this occurs. Currently buyers and sellers have to search the market, checking on websites like eBay and gumtree. A perfect tennis racquet enables this state to be more easily entered, thus this app will aim to elevate society as a whole through the individual. 

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
* Admin dashboard - edit/delete all users and racquets
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

<p>API's used: </p>

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
- Stripe
- Geocoder
- Ausburbs

---

### R12

User stories for your app

---

Upon landing on the site, an unregistered user can view racquets that have been listed for sale. They will be able to enter various search parameters to filter what is displayed below. The home page displays racquet "cards" styled to show the photo of the racquet, the price and title. There is 5 listings per page and a pagination feature to display more. The listings are displayed in order of last created. There is a large search bar at the top of the screen, which filters the racquets by description, length, balance, stiffness, string pattern, head size, brand or title.

From here the user can click on a listings photo to view the individual racquets show page to see more detailed information, such as the specifications, the description of the racquet, and more information about the location of the racquet which includes google map API information. When a racquets show page is viewed, the visits count is incremented by one. 

If the user clicks on "buy racquet", they will be taken to the login or signup page. From here the user will enter certain information about themselves and create an account. The first step is to enter an email and password, which is handled by the Devise gem. After this step they are redirected to the "user details" page and required to enter more information about their name, location, a photo and a description. If they choose not to upload a photo, a default picture is chosen. If for some reason the page closes or they enter a different URL, if the user details for the user remains nil then they will be redirected back to the user details page whenever they try to do an action that requires having user details. 

With an account now set up and logged in, the user can either list a racquet to sell or buy a racquet. If the user finds a racquet they wish to purchase, they can go to that racquets show page and click "buy this racquet" and will be taken to the Stripe website to enter their credit card information. Upon successful completion of this, an automatically generated conversation is started between the buyer and the seller in order to set up a pickup time. 

The user can click "My Account" to see their information, to view sales, view purchases, edit their profile, delete their profile and view their racquet listings. At this point clicking "view purchases" will take you to a page which lists all the purchases they have made. Conversely on the sellers account, if they click "view sales" it will list all the sales they have made and the total amount of money made through those sales. 

If the user sees a racquet they were interested in but are not willing to commit to buying at the current time, they can favorite the racquet which stores it on their favorites page. 
---

### R13

Wireframes for your app

---

https://www.figma.com/file/C3OSXh87tzmNvvCDX6Isgo/RacquetApp?node-id=10%3A0

Home Desktop: 
![Home](/docs/home.png "Home")

Product show page: 
![Product show page](/docs/product_show.png "Product show page")

User show page:
![User show page](/docs/user_show.png "User show page")

Favourites page:
![Favourites page](/docs/favourites_wireframe.png "Favourites page")

---

Home Mobile: 
![Home](/docs/home_responsive.png "Home")

Product show Mobile: 
![Product show page](/docs/product_show_responsive.png "Product show page")

User show page:
![User show page](/docs/user_show_responsive.png "User show page")

User show page:
![User show page](/docs/favourites_responsive.png "User show page")


---

### R14

An ERD for your app

---

https://www.lucidchart.com/documents/edit/d5391265-7e1d-44ac-bf07-e0b5534ee76b/0_0?beaconFlowId=744B23A6A8A8B79E

![ERD](/docs/RacquetApp.png "ERD")

<p>Note: This ERD was created at the start of the project and has since changed somewhat through development. The shopping cart idea was dropped, but conversations and messages tables were added. </p>

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

User:
* has many statuses
* has many racquets
* has many messages
* has one user detail
* has one favourite 

UserDetail:
* belongs to user
* has one location
* accepts nested attributes for location

Location: 
* belongs to user detail

Racquet: 
* belongs to user (as seller_user)
* has one status
* has one favourite 
* accepts nested attributes for favourite

Status:
* belongs to user (optional - assigned at purchase)
* belongs to racquet

Favourite: 
* belongs to user 
* belongs to racquet

Conversation: 
* belongs to user (as sender)
* belongs to user (as receiver) 
* has many messages

Message:
* belongs to conversation
* belongs to user

---

### R18

Discuss the database relations to be implemented in your application

---

When a User is created, they must enter a UserDetail to be able to access the rest of the user login features of the website. When a UserDetail is created, the form associated with it has nested attributes for location so it is created at the same time from the same form submit button. 

When a user creates a Racquet for sale, a Status is automatically generated and attached to that Racquet. The Status has a user_id reference to the User table, but is made optional since this is only assigned when / if the Racquet is purchased by a User. 

If a User wants to make a Racquet a Favourite, it creates a new row in Favourite with the Racquet Id and the User Id. If a User wants to talk to another User, a Conversation is created and a Messages table is created for that Conversation, which creates row entries for each Message sent. 

When a Racquet is deleted, the associated Status is also deleted.

When a UserDetail is deleted, either by themselves or the admin dashboard, this simultaneously deletes the Location (through dependent: :destroy),the Statuses, the Racquets and the Favourite and the User tables that were associated with this User as shown below: 

````ruby
def destroy
    @user_detail.destroy
    respond_to do |format|
      #delete racquets statuses and then the racquet
      User.find(@user_detail.user_id).racquets.each do |racquet|
        racquet.status.destroy
      end
      User.find(@user_detail.user_id).racquets.destroy_all
      #delete favourites
      if User.find(@user_detail.user_id).favourite != nil
        User.find(@user_detail.user_id).favourite.destroy
      end
      #delete user 
      User.find(@user_detail.user_id).destroy

      if current_user.user_detail.user_type == "admin"
        format.html { redirect_to user_details_path, notice: 'User detail was successfully destroyed.' }
      else
        format.html { redirect_to new_user_detail_path, notice: 'User detail was successfully destroyed.' } 
      end

      format.json { head :no_content }
    end
  end
````

---

### R19

Provide your database schema design

--- 

Bigint was used as the data type for references in most instances. In the Conversation table integer was used to check if both would work. The advantage of using a bigint is that its 64 bit and thus won't ever reach a point where it will run out, but a 32 bit (i.e. an integer data type) will eventually run out at 2.1 billion entries. An integer, however, uses up less space. 

I used a string for for "postcode" in the locations table as even though this is a number, no math is done on this entry and there is potential for a leading zero (i.e. if someone lives in the NT in 0800).

For smaller text entries the fields used are strings as this is more space efficient for the database (which maps to PostgreSQL's VAR-CHAR data type), but for areas that have potential to be over 255 characters (i.e. descriptions), I have used "text". 

Decimal was used for latitude and longitude as this is a formatting requirement to use the Google Maps API. 

A boolean was used for the Messages read column, as well as the Status sold column as these just require true or false. Also in the Status, the racquet type column uses an integer of 0 or 1 which uses an enum to map to "modern" or "classic". 

````Ruby

ActiveRecord::Schema.define(version: 2019_11_06_060324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "racquet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["racquet_id"], name: "index_favourites_on_racquet_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "state"
    t.string "suburb"
    t.string "address_line"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_detail_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["user_detail_id"], name: "index_locations_on_user_detail_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "racquets", force: :cascade do |t|
    t.text "description"
    t.string "head_size"
    t.string "length"
    t.string "strung_weight"
    t.string "balance"
    t.string "stiffness"
    t.string "string_pattern"
    t.string "brand"
    t.integer "racquet_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seller_user_id"
    t.string "title"
    t.float "price"
    t.index ["seller_user_id"], name: "index_racquets_on_seller_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "sold"
    t.date "date_sold"
    t.integer "view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "racquet_id"
    t.bigint "user_id"
    t.index ["racquet_id"], name: "index_statuses_on_racquet_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favourites", "racquets"
  add_foreign_key "favourites", "users"
  add_foreign_key "locations", "user_details"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "racquets", "users", column: "seller_user_id"
  add_foreign_key "statuses", "racquets"
  add_foreign_key "statuses", "users"
  add_foreign_key "user_details", "users"
end

````

---

### R20

Describe the way tasks are allocated and tracked in your project

---

This project had tasks divided up into "todo", "MVP" "BEAST", "DONE" and "issues to get help on" categories. At the start of the day we would have in-class meetings talking about our objectives for the day, and I would then add tasks from the MVP and BEAST categories to my "todo" list which reflected the most pressing issues which were my focus for the day. If completed, they would get moved to DONE. If I had an unsolvable issue, they would move to the "issues to get help on" category and stay there until I had access to a teacher or another student who had conquered a similar issue. 

### Trello boards

![Trello](/docs/trello1.png "Trello")
![Trello](/docs/trello2.png "Trello")
![Trello](/docs/trello3.png "Trello")
![Trello](/docs/trello4.png "Trello")
![Trello](/docs/trello5.png "Trello")
![Trello](/docs/trello6.png "Trello")
![Trello](/docs/trello7.png "Trello")
![Trello](/docs/trello8.png "Trello")
![Trello](/docs/trello9.png "Trello")








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
 def destroy
    @user_detail.destroy
    respond_to do |format|
      #delete racquets statuses and then the racquet
      User.find(@user_detail.user_id).racquets.each do |racquet|
        racquet.status.destroy
      end
      User.find(@user_detail.user_id).racquets.destroy_all
      #delete favourites
      if User.find(@user_detail.user_id).favourite != nil
        User.find(@user_detail.user_id).favourite.destroy
      end
      #delete user 
      User.find(@user_detail.user_id).destroy

      if current_user.user_detail.user_type == "admin"
        format.html { redirect_to user_details_path, notice: 'User detail was successfully destroyed.' }
      else
        format.html { redirect_to new_user_detail_path, notice: 'User detail was successfully destroyed.' } 
      end

      format.json { head :no_content }
    end
  end
````

