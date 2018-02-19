require 'rails_helper'

RSpec.describe Zombie, type: :model do
	# Association test
  	# ensure Zombie model has a 1:m relationship with the ZombieArmor model
    it { should have_many(:zombie_armors).dependent(:destroy) }
    # ensure Zombie model has a 1:m relationship with the ZombieWeapon model
    it { should have_many(:zombie_weapons).dependent(:destroy) }
    # Validation tests
  	# ensure crucial columns of the Zombie are present before saving
    it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:hit_points) }
  	it { should validate_presence_of(:brains_eaten) }
  	it { should validate_presence_of(:speed) }
  	it { should validate_presence_of(:turn_date) }
end
