# README

###Step 1
`$ rails new api-project --api --no-sprockets -d postgresql`
> Create API project with "api-project" name, NO Asset Pipeline, use Postgresql instead of sqlite.

###Step 2
`$ rails (generate/g) model contact`
> It will generae contact.rb in app/models folder and migration file in db/migrate folder
![](https://github.com/Nemrosim88/learn-ruby-projects/raw/master/rails-projects/api-project/read-me-images/2019-08-31_14-04-30.jpg)

###Step 3
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