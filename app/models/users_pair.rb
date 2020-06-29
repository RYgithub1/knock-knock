class UsersPair < ApplicationRecord

  belongs_to :pair, optional: true
  belongs_to :user, optional: true

end
