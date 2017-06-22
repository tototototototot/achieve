class ContactsController < ApplicationController
  def index
	  redirect_to new_contact_path
  end
  
  def new
	  if params[:back]
      @contacts = Contact.new(contacts_params)
    else
      @contacts = Contact.new
    end
  end

  def create 
	#  Contact.create(contacts_params)
	#  redirect_to new_contact_path
     @contacts = Contact.new(contacts_params)
    if @contacts.save
      redirect_to root_path, notice: "お問い合わせが完了しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

 def confirm
    @contacts = Contact.new(contacts_params)
    render :new if @contacts.invalid?
 end


  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end

  
end
