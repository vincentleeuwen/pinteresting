class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end


  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end


  def create
    @pin = Pin.new(pin_params)

      if @pin.save
        format.html redirect_to @pin, notice: 'Pin was successfully created.' 
      else
        format.html render action: 'new' 
      end
  end

  def update
    if @pin.update(pin_params)
      format.html redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      format.html render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
      format.html { redirect_to pins_url }
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:describtion)
    end
end
