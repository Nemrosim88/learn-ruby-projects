# README

### Requirements
installed posgresql
https://www.postgresql.org/download/


### Step 1
`$ rails new api-project --api --no-sprockets -d postgresql`
> Create API project with "api-project" name, NO Asset Pipeline, use Postgresql instead of sqlite.

### Step 2
`$ rails (generate/g) model contact`
> It will generae contact.rb in app/models folder and migration file in db/migrate folder
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/2019-08-31_14-04-30.jpg)

### Step 3
> Add three new field to migration file with type string

```ruby
class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
```
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/2019-08-31_14-20-14.jpg)

### Step 4
> If there is not installed and started postgresql servers - install and start it

### Step 5
> In pgAdmin create new database - api_project_development
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/ps-bd-create.jpg)
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/ps-db-create-save.jpg)

### Step 6
> Add username and password to "database.yml" file in /config folder

```ruby
development:
  <<: *default
  database: api_project_development
  username: postgres
  password: admin
```

### Step 7
`$ rails db.migrate`
> It will generae contact.rb in app/models folder and migration file in db/migrate folder
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/2019-08-31_14-04-30.jpg)