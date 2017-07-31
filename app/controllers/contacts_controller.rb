class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    Rails.logger.debug "Debug: entering the create method"
    @contact = Contact.new(contact_params)
    Rails.logger.debug "Debug: Is contact valid? #{@contact.valid?}"
    if @contact.valid?
      Rails.logger.debug "Debug: contact is valid!"
      # TODO send message
      flash[:notice] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      flash.now[:alert] = "The following errors
                           prevented the message to be sent:"
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
