class AboutNation < ApplicationRecord

  # to Abouts Table and Nations Table
  belongs_to :about
  belongs_to :nation
  validates :about_id, presence: true
  validates :nation_id, presence: true

end
