class BasketCaseController < ApplicationController
  before_action :set_fruits
  before_action :set_items

  def index; end

  def order_by_fruit
    @list_items = @list_items.sort_by {|fruit,_ | fruit.to_s}
    @list_items = @list_items.reverse! if params.has_key?(:order) && params[:order] == "desc"
    @sorted_by = "name"
    render 'basket_case/index'
  end

  def order_by_amount
    @list_items = @list_items.sort_by {|_, amount| amount}
    @list_items = @list_items.reverse! if params.has_key?(:order) && params[:order] == "desc"
    @sorted_by = "amount"
    render 'basket_case/index'
  end

  private
    def set_fruits
      @fruits = {
        oranges: 5,
        apples: 9,
        grapes: 3,
        watermelons: 2,
        guavas: 4
      }
    end

    def set_items
      @list_items = @fruits
    end
end
