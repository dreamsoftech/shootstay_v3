class HousesController < ApplicationController
  before_filter :authenticate_user!

	respond_to :json, only: [:create, :update]

  def create
    @house = House.new(params[:house])
    if @house.save
      respond_with(@house, :status => 200, :default_template => :show)
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def update
    @house = House.find(params[:id])

    if @house.update_attributes(params[:house])
      respond_with(@house, :status => 200, :default_template => :show)
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  def new
    @house = House.new
    @house.homeowner_id = params[:homeowner]
  end
  
  def edit
    @house = House.find(params[:id])

  end

  def show
    @house = House.find(params[:id])

  end
end