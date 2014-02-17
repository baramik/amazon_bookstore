class Customer < ActiveRecord::Base
  USER_STATUSES = %W(basic middle gold admin)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :orders
	has_many :credit_cards
  has_many :books, through: :wish_list

  scope :client_orders, ->(id){where("orders.customer_id = ?", id)}
  validates :email, uniqueness: true
  after_save :set_default_user_type
  	#create wishlist table to store customers books he wish to buy

    def orders_history
  		self.orders.where(self.id)
  	end

    def set_default_user_type
      self.admin = false
    end

end



