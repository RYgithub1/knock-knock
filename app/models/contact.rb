# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  cmail      :string(255)      default(""), not null
#  content    :text(65535)      not null
#  name       :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Contact < ApplicationRecord

  validates :name,    presence: true
  validates :cmail,   presence: true
  validates :title,   presence: true
  validates :content, presence: true

  # [1]confirm input contents with validation
  validates_acceptance_of :confirming
  # [2]confirm 2nd check
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end

end
