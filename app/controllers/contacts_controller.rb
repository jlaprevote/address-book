class ContactsController < ApplicationController
  include ContactsHelper

  def index
    @contacts = Contact.all
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

end
