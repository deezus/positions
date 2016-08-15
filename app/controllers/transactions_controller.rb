class TransactionsController < ApplicationController
  before_action :find_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transaction = Transaction.all
  end

  def new
    @trade = Trader.all
    @actions = Action.all
    @transaction = Transaction.new
  end

  def show
  end

def create
  @transaction = Transaction.new
  @transaction.trader = params[:trader]
  #@transaction.action = params[:action]
  @transaction.quantity = params[:quantity]
  @transaction.price = params[:price]
  trader = Trader.new
  trader = @transaction.trader
  trader.lastname = @transaction.trader.lastname
  #puts @transaction.trader
  #trader.value += @transaction.quantity * @transaction.price
  #trader.save

  if @transaction.save
    redirect_to transactions_path
  else
    render 'new'
  end
end

def edit
end

def update
  @transaction.quantity = params[:quantity]
  @transaction.price = params[:price]
  @trader.value += @transaction.quantity * @transaction.price
  if @transaction.update(:quantity => params[:quantity], :price => params[:price])
    redirect_to transactions_path(@transaction)
  else
    render 'edit'
  end
end

def destroy
  @transaction.destroy
  redirect_to transactions_path
end

private
  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

end
