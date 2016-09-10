require 'rails_helper'

RSpec.describe Group, type: :model do
	it { should have_db_column(:name).of_type(:string) }
	it { should validate_presence_of(:name) }
	it { should validate_uniqueness_of(:name) }
	it { should have_many(:users) }
	it { should allow_values('zamalek', 'dream land', "abc def").for(:name) }
	it { should_not allow_values(nil).for(:name) }
end
