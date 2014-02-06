class Order < ActiveRecord::Base
	  belongs_to :customer
    belongs_to :credit_card
	  belongs_to :billing_address, class_name: Address
  	belongs_to :shipping_address, class_name: Address
  	has_many :order_items, dependent: :destroy
    has_one :shipment

  	validates :total_price, numericality: {only_integer: false}
  	validates :completed_date, numericality: {only_integer: true} 
  	validates :state, inclusion: {in: %W(inprogress deslined postponed completed)}, presence: true

  	#after_save :total_price_count
    #before_save :total_price_count
  	scope :all_deslined, -> {where state: 'deslined'}
  	scope :all_completed, -> {where state: 'completed'}
  	scope :all_postponed, -> {where state: 'postponed'}
    scope :all_in_progress, -> {where state: 'inprogress'}

  	#def total_price_count
  	#	order_items.each {|item| item.price}.sum.to_f
  	#end

    def total_price_count
        #self.joins(:order_items).where('orders.id = ?', self.id).sum('price').to_f
    end

  	def set_deslined
  		self.state = 'deslined'
      save!
  	end

  	def set_completed
      self.completed_date = Date.today
  		self.state = 'completed'
  	  save!
    end

  	def set_postponed
  		self.state = 'postponed'
  	  save! 
    end

  	def set_in_progress
  		self.state = 'inprogress'
  	  save! 
    end
end
