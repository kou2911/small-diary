class ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to root_path
    else
      render :new
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:genre_id, :memo)
    end
end
