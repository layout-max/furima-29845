class Message < ApplicationRecord
  belings_to :users
  belongs_to :rooms
end
