ATM
==============
[![Code Climate](https://codeclimate.com/github/duthied/yolo-octo-bebo.png)](https://codeclimate.com/github/duthied/yolo-octo-bebo) [![Test Coverage](https://codeclimate.com/github/duthied/yolo-octo-bebo/coverage.png)](https://codeclimate.com/github/duthied/yolo-octo-bebo)

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

### Interfaces

#### Web-Client
*****
##### Authentication
TBD

### TODO
TBD
