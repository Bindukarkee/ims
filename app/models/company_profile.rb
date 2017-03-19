class CompanyProfile < ApplicationRecord
  mount_uploader :logo, LogoUploader

  belongs_to :fiscal_year
end
