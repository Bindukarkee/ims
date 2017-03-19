class CompanyProfilesController < ApplicationController

  def new
    @company_profile =CompanyProfile.new
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
  end

  def index
    @page = params[:page] || 1
    @company_profile = CompanyProfile.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.update(company_profile_param)
    @log = Log.create(description: "Updated Unit: " + @company_profile.name, user: current_user)
    redirect_to @company_profile
  end

  def destroy
    @company_profile = CompanyProfile.destroy(params[:id])
    redirect_to @company_profile
  end


  def create
    @company_profile = CompanyProfile.new(company_profile_param)
    if @company_profile.save
      redirect_to @company_profile
    else
      render 'new'
    end
  end

  private
  def company_profile_param
    params.require(:company_profile).permit(:name, :address, :vdc_mun, :ward_no, :phone_no, :vat_pan_no, :logo, :district, :zone, :fiscal_year_id)
  end

end
