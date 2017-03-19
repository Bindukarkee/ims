class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @sale = Sale.paginate(:page => params[:page], :per_page => 4)
  end

  def edit

    @sale = Sale.find(params[:id])
  end

  def update
    @sale= Sale.find(params[:id])
    @log = Log.create(description: "Updated Sale Item: " + @sale.name, user: current_user)
    @sale.update(sale_param)
    redirect_to @sale
  end

  def destroy
    @sale = Sale.destroy(params[:id])
    @log = Log.create(description: "Deleted sale Item: " + @sale.name, user: current_user)
    redirect_to @sale
  end


  def create
    @sale = Sale.new(sale_param)
    if @sale.save
      @log = Log.create(description: "Created sale Item: " + @sale.name, user: current_user)
      redirect_to @sale
    else
      render 'new'
    end
  end

  private
  def sale_param
    params.require(:sale).permit(:item_name, :item_id, :unit_sell_price, :quantity, :cash_credit, :customer_id)
  end
end

