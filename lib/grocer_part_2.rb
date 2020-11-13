require_relative './part_1_solution.rb'

require 'pry'

def apply_coupons(cart, coupons)
  cart.map { |produce|
    produce.map { |key, value|
      coupons.map { |tag|
        tag.map { |t_key, t_value|
          if value == t_value && key == t_key
            produce[:count] = produce[:count] - tag[:num]
            cart.push({
              :item => t_value + " W/COUPON",
              :price => tag[:cost] / tag[:num],
              :clearance => produce[:clearance],
              :count => tag[:num]
            })
          end
        }
      }
    }
  }
  return cart
end

def apply_clearance(cart)
  cart.map { |produce|
    produce.map { |key, value|
      if key == :clearance && value == true
        puts produce[:price]
        produce[:price] = produce[:price] - ((produce[:price] * 0.2).floor(2))
        puts produce[:price]
      end
    }
  }
  return cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
