class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products = Product.order(id: :desc).all

    @products_count = Product.count
    @categories = Product.group(:category_id).count


  end

end
