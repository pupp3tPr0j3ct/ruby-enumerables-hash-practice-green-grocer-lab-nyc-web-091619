def consolidate_cart(cart)
 final_hash = {}
 cart.each do |element_hash|
   element_name = element_hash.keys[0]
   element_stats = element_hash.values[0]
   
   if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1
   else
      final_hash[element_name] = {
        count: 1,
        price: element_stats[:price],
        clearance: element_stats[:clearance]
      }
   end
  end
  final_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[item]
    if cart[item]
      if cart[item] && cart[item][:count] >= coupon[:num] && !cart.has_key?["#{item} W/COUPON"]
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance] , count: coupon[:num]}
        cart[item][:count] -= coupon[:num]
      elsif coupon[item][:count] >= coupon[:num] && !cart.has_key?["#{item} W/COUPON"]
        cart["#{item} W/COUPON"][:count] += coupon[:num]
        cart[item][:count] -= coupon[:num]
      
      end
    end
  end
    cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
