class TradersController < ApplicationController

  before_action :find_trader, only: [:show, :edit, :update, :destroy]

  @traders

  def index
    @traders = Trader.all.order("value DESC")
  end

  def new
    @trader = Trader.new
  end

  def show
  end

  def create
    @trader = Trader.new
    @trader.value = 0
    @trader.firstname = params[:firstname]
    @trader.lastname = params[:lastname]
    @trader.save
    if @trader.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def change(a, b)
    @trader.value += a * b
  end

  def update
    @trader.firstname = params[:firstname]
    @trader.lastname = params[:lastname]
    if @trader.update(:firstname => params[:firstname], :lastname => params[:lastname])
      redirect_to trader_path(@trader)
    else
      render 'edit'
    end
  end

  def destroy
    @trader.destroy
    redirect_to root_path
  end

  private

    def find_trader
      @trader = Trader.find(params[:id])
    end
end
