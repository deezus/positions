class Transaction < ApplicationRecord
  belongs_to :trader
  belongs_to :action
end
