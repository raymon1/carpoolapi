require 'rails_helper'

RSpec.describe User, type: :model do
	it { should have_db_column(:first_name).of_type(:string) }
	it { should have_db_column(:last_name).of_type(:string) }
	it { should have_db_column(:phone_number).of_type(:string) }
	it { should have_db_column(:work_place_id).of_type(:integer) }
	it { should have_db_column(:home_place_id).of_type(:integer) }
	it { should have_db_column(:group_id).of_type(:integer) }

	it { should belong_to(:group)}
	it { should belong_to(:work_place)}
	it { should belong_to(:home_place)}
	it { should allow_values('Tyrion', 'abd allah', "abd-allah").for(:first_name) }
	it { should allow_values('Tyrion', 'abd allah', "abd-allah").for(:last_name) }
	it { should_not allow_values(nil).for(:first_name) }
	it { should_not allow_values(nil).for(:last_name) }
end
