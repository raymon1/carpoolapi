require 'rails_helper'

RSpec.describe Trip, type: :model do
	it { should have_db_column(:driver_id).of_type(:integer) }
	it { should have_db_column(:source_id).of_type(:integer) }
	it { should have_db_column(:destination_id).of_type(:integer) }
	it { should have_db_column(:seats).of_type(:integer) }
	it { should have_db_column(:departure_time).of_type(:datetime) }

	it { should belong_to(:driver)}
	it { should belong_to(:source)}
	it { should belong_to(:destination)}
	it { should have_many(:trip_joins)}
	it { should have_many(:users).through(:trip_joins)}

	it { should validate_presence_of(:driver) }
	it { should validate_presence_of(:source) }
	it { should validate_presence_of(:destination) }
	it { should validate_presence_of(:seats) }
	it { should validate_presence_of(:departure_time) }
	it { should validate_numericality_of(:seats) }
	it { should allow_values(1,2,3,4,10,99,5.0).for(:seats)}
	it { should_not allow_values(0, -1, 1.1, 101).for(:seats)}
end
