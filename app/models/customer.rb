class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_action :customer_state, only: [:create]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :telephone_number, presence: true
    
  protected
  
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password]) && !@customer.is_deleted
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_session_path
    end
  end
end
