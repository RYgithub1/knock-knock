class AboutLanguage < ApplicationRecord

  # to Abouts Table and Languages Table
  belongs_to :about
  belongs_to :Language
  validates :about_id, presence: true
  validates :Language_id, presence: true

end
