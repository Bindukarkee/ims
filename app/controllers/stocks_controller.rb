class StocksController < ApplicationController


  def new
    @stock = Stock.new
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @stock = Stock.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock= Stock.find(params[:id])
    @stock.update(stock_param)
    redirect_to @stock
  end

  def destroy
    @stock = Stock.destroy(params[:id])
    redirect_to @stock
  end


  def create
    @stock = Stock.new(stock_param)
    if @stock.save
      redirect_to @stock
    else
      render 'new'
    end
  end



  private
  def stock_param
    params.require(:stock).permit(:item_id, :quantity, :unit_price, :est_sell_price)
  end
  
end
