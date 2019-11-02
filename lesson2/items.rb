#!/Users/peterstudnicka/.nix-profile/bin/ruby -w
class Item
    attr_accessor :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end
end

class Product < Item

end



class MonetaryValue
    attr_accessor :manu_cost, :mark_up, :date_recieved
    @PRICE_UPDATE = "monthly"
    @PRICE_CHANGE = 5  # price update in percentage
end