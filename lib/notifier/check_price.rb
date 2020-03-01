class CheckPrice
    def call(price, boundary)
        if price > boundary
            puts "Price is #{price}, time to buy"
            #`say "Price is #{price}, time to buy"`
        end 
    end
end

