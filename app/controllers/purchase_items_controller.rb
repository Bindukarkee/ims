class PurchaseItemsController < ApplicationController

  def show

    @purchase = Purchase.find(params[:id])
    @purchase_item = PurchaseItem.where(purchase_id: params[:id])
    @purchase_items = @purchase_item.paginate(:page => params[:page], :per_page => 20)
    @page = params[:page] || 1

    end

end
