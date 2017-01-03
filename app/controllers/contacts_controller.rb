class ContactsController < ApplicationController
  include ContactsHelper

  def index
    @contacts = Contact.all
  end

  def alpha
    @contacts = Contact.all.order(:l_name)

    redirect_to contacts_path
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save

    redirect_to contacts_path
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash.notice = "Contact Deleted!"

    redirect_to contacts_path
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)

    flash.notice = "Contact Updated"

    redirect_to contact_path(@contact)
  end

end
