class Admin::DashboardController < ApplicationController
  def show
    @product = Product.count(:id)
    @categories = Category.count(:id)
  end
end