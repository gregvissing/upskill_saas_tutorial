class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)  # {name: 'asdf', email: 'asdf', comments: 'asdf'}
        if @contact.save
            redirect_to new_contact_path, notice: "Message sent."
        else
            redirect_to new_contact_path, notice: "Error occured."
        end
    end
    
    private         # private methods are only for inside file
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)   # save securely to DB
        end
end