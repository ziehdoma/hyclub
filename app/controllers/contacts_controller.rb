class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_param)
  	@contact.request = request
  	if @contact.deliver
  		flash.now[:alert] = 'Thank you'

  	else 
  		flash.now[:error] ='Cannot send message.'
  		render :new 
  	end 
  end

  private 
  def contact_param
  	params[:contact]
  end 
  
end
