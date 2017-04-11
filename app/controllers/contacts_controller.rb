class ContactsController < ApplicationController
    
    # GET request to /contact-us
    # Show new contact form
    def new                         # new action
        @contact = Contact.new
    end
    
    # POST request /contacts
    def create                      # create/save action
        
        # Mass assignment of form fields into Contact object
        @contact = Contact.new(contact_params)  # {name: 'asdf', email: 'asdf', comments: 'asdf'}
        
        # Save the Contact object to the datbase
        if @contact.save
        
            # Store form fields via parameters, into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
        
            # Plug variables into Contact Mailer 
            # email method and send email
            ContactMailer.contact_email(name, email, body).deliver
        
            # Store success message in flash hash
            # and redirect to the new action
            flash[:success] = "Message sent."
            redirect_to new_contact_path
        
        else
        
            # If Contact object doesn't save,
            # store errors in flash hash,
            # and redirect to the new action
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        
        end
    end
    
    private         # private methods are only for inside file
        # To collect data from form, we need to use
        # strong parameters and whitelist form fields
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)   # save securely to DB
        end
end