class PurchasesController < ApplicationController

  def new
    @purchase = Purchase.new
    @purchase_item = @purchase.purchase_items.build
    @item = Item.order(:name)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @totalcost = 0
    @purchase.purchase_items.each do |total|
      if total.present?
        @totalcost += (total.unit_price * total.quantity)
      end
    end
    @purchase.total = @totalcost
    @fiscal_year = FiscalYear.all
    @fiscal_year.each do |f|
      @fiscal = f.name
    end
=begin
    @purchase.fiscal_year = @fiscal
=end
    if @purchase.save
      @purchase.purchase_items.each do |g|
        if g.present?
          @stocks = Stock.where(item_id: g.item_id)
          @stocks.each do |f|
            @stock = f
          end
          @stock.unit_price = ((@stock.unit_price * @stock.quantity) + (g.unit_price * g.quantity)) / (@stock.quantity + g.quantity)
          @stock.quantity = @stock.quantity + g.quantity

          @stock.save
        end
      end
      redirect_to :purchases
    else
      @item = Item.order(:name)
      render 'new'
    end
  end


  def index
    @purchase = Purchase.paginate(:page => params[:page], :per_page => 20)
    @page = params[:page] || 1
  end


  def item_select
    @item = Item.select('name,id')
    render json: @item
  end


  private

  def purchase_params
    params.require(:purchase).permit(:supplier_id, purchase_items_attributes: [ :purchase_id , :item_id, :quantity, :bill_no,:fiscal_year, :unit_price ])
  end
end

