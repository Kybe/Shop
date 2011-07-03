class CartController < ApplicationController

  def add
    id = params[:id]
    
    cart = session[:cart] ||= {}
    cart[id] = (cart[id] || 0) + 1
        
    redirect_to :action => :index
  end

  def index
    @cart = session[:cart] || {}
  end
  
    def change
    cart = session[:cart]
    id = params[:id];
    quantity = params[:quantity].to_i
    if cart and cart[id]
      unless quantity <= 0
        cart[id] = quantity
      else
        cart.delete id
      end
    end
    redirect_to :action => :index
  end
  
  def checkout
    flash[:notice] = "CHECKOUT IS NOT IMPLEMENTED YET!!!"
    redirect_to :action => :index
  end
  
  
  
 end
