class Customer < ActiveRecord::Base
	has_many :orders
	has_many :credit_cards

	validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  	def change_account_info
  		#edit account info such as(cr card, shipping_adress, billing address...etc)
  	end
  	#create wishlist table to store customers books he wish to buy

  	def check_orders_statuses
  		self.select(:status).joins(:orders).where('orders.orders_id = ?', self.order_id)
  	end
end



