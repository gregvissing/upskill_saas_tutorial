class Contact < ActiveRecord::Base
    # validate form
    # will save if each is true
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
end