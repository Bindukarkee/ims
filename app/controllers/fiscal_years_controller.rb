class FiscalYearsController < ApplicationController

  def new
    @fiscal_year = FiscalYear.new
  end

  def show
    @fiscal_year = FiscalYear.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @fiscal_year = FiscalYear.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @fiscal_year = FiscalYear.find(params[:id])
  end

  def update
    @fiscal_year = FiscalYear.find(params[:id])
    @log = Log.create(description: "Updated Fiscal_Year: " + @fiscal_year.name, user: current_user)
    @fiscal_year.update(fiscal_year_param)
    redirect_to @fiscal_year
  end

  def destroy
    @fiscal_year = FiscalYear.destroy(params[:id])
    redirect_to @fiscal_year
  end


  def create
    @fiscal_year = FiscalYear.new(fiscal_year_param)
    if @fiscal_year.save
      redirect_to @fiscal_year
    else
      render 'new'
    end
  end

  private
  def fiscal_year_param
    params.require(:fiscal_year).permit(:name, :end_date, :start_date)
  end
end
