class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items
    
    def total
        ammount = 0
        line_items.each {|item| ammount += item.price*item.quantity}
        ammount
    end
    
    def add_item(item_id)
        cart_item = self.line_items.find_by(item_id: item_id)
        if cart_item
            cart_item.quantity +=1
            cart_item.save
            cart_item
        else
           self.line_items.build(item_id: item_id)
        end
    end
    
    def take_home
        line_items.each do |line_item| 
            line_item.item.inventory -= line_item.quantity
            line_item.item.save
        end
        self.user.drop_cart
        self.status = 'submitted'
        self.save
    end
    
end
