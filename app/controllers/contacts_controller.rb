class ContactsController < ApplicationController
  include ContactsHelper

  def index
    if params[:order] == 'l_name_asc'
      @contacts = Contact.all.order('l_name')
    elsif params[:order] == 'f_name_asc'
      @contacts = Contact.all.order('f_name')
    elsif params[:order] == 'l_name_des'
      @contacts = Contact.all.order('l_name DESC')
    elsif params[:order] == 'f_name_des'
      @contacts = Contact.all.order('f_name DESC')
    else
      @contacts = Contact.all
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = "Contact Created"
      redirect_to contacts_path
    else
      flash.now[:fail] = "Contact could not be created! Please check the form"
      render :new
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      flash[:success] = "Contact Deleted"
      redirect_to contacts_path
    else
      flash.now[:fail] = "Failed to Delete"
      render :edit
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:success] = "Contact Updated"
      redirect_to contact_path(@contact)
    else
      flash[:fail] = "Failed to update contact! Please check the form"
      render :edit
    end
  end

end
