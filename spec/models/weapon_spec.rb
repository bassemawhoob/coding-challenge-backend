require 'rails_helper'

RSpec.describe Weapon, type: :model do
  	# Association test
  	# ensure Zombie model has a 1:m relationship with the ZombieWeapon model
    it { should have_many(:zombie_weapons).dependent(:destroy) }
end
