class Plan < ActiveRecord::Base
    # each plan can have many users
    has_many :users
end