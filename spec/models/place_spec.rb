require 'rails_helper'

RSpec.describe Place, type: :model do

	it { should have_db_column(:name).of_type(:string) }
	it { should have_db_column(:longitude).of_type(:float) }
	it { should have_db_column(:latitude).of_type(:float) }

	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name) }
	it { should validate_presence_of(:longitude) }
	it { should validate_presence_of(:latitude) }
	it { should validate_numericality_of(:longitude) }
	it { should validate_numericality_of(:latitude) }

	it { should allow_values('zamalek', 'dream land', "abc def").for(:name) }
	it { should_not allow_values(nil).for(:name) }
	it { should allow_values(-90,0, 90, 50.5, -50.5, 4.12345).for(:latitude) }
	it { should allow_values(-180,0, 180, 50.5, -50.5, -1.23456).for(:longitude) }
	it { should_not allow_values(-91,'a', 91, 90.1,-90.1).for(:latitude) }
	it { should_not allow_values(-1180,'b', 180.1, -181, 181, -180.1).for(:longitude) }
end
