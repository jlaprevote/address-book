module ContactsHelper

  def contact_params
    params.require(:contact).permit(:f_name, :l_name, :address, :phone, :email)
  end

end
