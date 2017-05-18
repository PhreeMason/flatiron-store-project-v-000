class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: "Cart"
  
  def drop_cart
    self.current_cart_id = nil
    self.save
  end
  
  def add_cart
    self.current_cart = self.carts.create
    save
    current_cart
  end
end
