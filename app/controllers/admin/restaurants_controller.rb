class Admin::RestaurantsController < ApplicationController
  before_action :authenticate
  layout "admin"


  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to :action => :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to :action => :show, :id => @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to :action => :index
  end





  protected

  def authenticate
     authenticate_or_request_with_http_basic do |user_name, password|
         user_name == "username" && password == "password"
     end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name,:tel,:address,:description,:image)
  end








end
