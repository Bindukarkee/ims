class ItemsController < ApplicationController


  def new
    @item =Item.new
    @item.build_stock
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @item = Item.paginate(:page => params[:page], :per_page => 10)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item= Item.find(params[:id])
    @log = Log.create(description: "Updated Item: " + @item.name, user: current_user)
    @item.update(item_param)
    redirect_to @item
  end

  def destroy
    @item = Item.destroy(params[:id])
    @log = Log.create(description: "Deleted Item: " + @item.name, user: current_user)
    redirect_to @item
  end


  def create
    @item = Item.new(item_param)
    @company_profile = CompanyProfile.first
    @item.fiscal_year = @company_profile.fiscal_year
    if @item.save
      @log = Log.create(description: "Created Item: " + @item.name, user: current_user)
      redirect_to @item
    else
      render 'new'
    end
  end

  private
  def item_param
    params.require(:item).permit(:name, :unit_id, :item_code, :item_group_id, :description,
                                  stock_attributes: [:item_id, :quantity, :unit_price, :est_sell_price])
  end

end

