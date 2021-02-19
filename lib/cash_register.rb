require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_trans

    def initialize(discount=0)
        @total= 0
        @discount= discount
        @cart= []
        @last_trans = 0
    end

    def add_item(title,price, quantity = 1)
        self.total += (price *quantity)
        @last_trans = price * quantity

        quantity.times do 
            @cart << title
        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            discount =  (@discount.to_f/100)
            @total = self.total - (discount * self.total)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        @cart

    end

    def void_last_transaction
        self.total -= @last_trans
    end
end
