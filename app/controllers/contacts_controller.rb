class ContactsController < ApplicationController
    def new                         # new action
        @contact = Contact.new
    end
    
    def create                      # create/save action
        @contact = Contact.new(contact_params)  # {name: 'asdf', email: 'asdf', comments: 'asdf'}
        if @contact.save
            name = params[:contact][:name]
            email = [:contact][:email]
            body = [:contact][:comments]
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private         # private methods are only for inside file
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)   # save securely to DB
        end
end