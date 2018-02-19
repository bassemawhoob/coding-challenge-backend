require 'rails_helper'
RSpec.describe Armor, type: :model do
	# Association test
  	# ensure Zombie model has a 1:m relationship with the ZombieArmor model
    it { should have_many(:zombie_armors).dependent(:destroy) }
end
