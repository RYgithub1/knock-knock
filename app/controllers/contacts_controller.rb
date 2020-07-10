class ContactsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]


  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        # [2]after_validation -> beConfirming -> root
        format.html { redirect_to root_path }
      else
        # [1]btn -> noConfirming -> (.save)false
        format.html { render action: "new" }
      end
    end
  end


  private
  def contact_params
    params.require(:contact).permit(
      :name,
      :cmail,
      :title,
      :content,
      :confirming
    )
  end

end
