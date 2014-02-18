class Order < ActiveRecord::Base
	  PERMITTED_STATUSES = %W(in_progress in_queue in_delivery delivered rejected)

    belongs_to :customer
    has_one :credit_card
	  has_one :billing_address, class_name: Address
  	has_one :shipping_address, class_name: Address
  	has_many :order_items, dependent: :destroy
    has_one :shipment

  	validates :total_price, numericality: {only_integer: false}
  	validates :state, inclusion: {in: PERMITTED_STATUSES}, presence: true

  	#after_save :total_price_count
    #before_save :total_price_count
  	scope :all_deslined, -> {where state: 'rejected'}
  	scope :all_completed, -> {where state: 'delivered'}
  	scope :all_postponed, -> {where state: 'in_delivery'}
    scope :all_in_progress, -> {where state: 'in_progress'}
  	#def total_price_count
  	#	order_items.each {|item| item.price}.sum.to_f
  	#end

    def total_price_count
       self.joins(:order_items).where('order.id = ?', self.id).sum('price').to_f
    end

  	def set_rejected
  		self.state = 'rejected'
      save!
  	end

  	def set_delivered
      self.completed_date = DateTime.now
  		self.state = 'delivered'
  	  save!
    end

  	def set_in_delivery
  		self.state = 'in_delivery'
  	  save! 
    end

  	def set_in_progress
  		self.state = 'inprogress'
  	  save! 
    end

  def set_in_queue
    self.state = 'in_queue'
    save!
  end

end
