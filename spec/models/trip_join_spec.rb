require 'rails_helper'

RSpec.describe TripJoin, type: :model do
	it { should have_db_column(:user_id).of_type(:integer) }
	it { should have_db_column(:trip_id).of_type(:integer) }
end
