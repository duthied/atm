ATM
==============

This is a simple ATM client written in Ruby on Rails (v.4.0.4).

### Prepration and Execution
Ensure you are running a Postgres database server.
The database settings are in config/database.yml

To prepare the sample data, execute 
```
rake db:reset
```

Install the gems:
```
bundle install
```

Start the server
** if the Bank portion of this project is running on the same machine, you will need to specify a different port than the Bank portion.
```
rails server
```

Connection to the Bank server is defined in `Rails.application.config` variable in the appropriate environment's config file (config/environments/development, etc.)

### Interfaces

#### Web-Client
*****
The root of the user-face interface is a login form.  This posts to the server but passes the authentication check along to the 'bank' env. var. defined in application.rb.  Once validation passes, the card_number and pin are stored in the browser's cookies.  This is a make-do solution, with more time I would be plugging this into Devise.

After logging in, the user is sent to an account listing, each is a link to a withdraw form for that account.

Each of the views in the ATM app makes an api call to the Bank app and displays the results from the Bank server.  This ATM server is completly stateless.

##### Authentication
See 'Web-Client'

### TODO
A Postgres database is configured but not yet used.  This db could be used to cache the results pulled from the Bank server in a case where the Bank server is unavailable.  Withdraws would not be allowed but the data that was cached would be readable.

Test coverage is poor, needs improvement.  I haven't had much experience with mocking/stubbing api calls which are critical in this app.
