require 'rails_helper'

RSpec.describe ZombieWeapon, type: :model do
  	  # Association test
	  # ensure an ZombieWeapon is a many-to-many table for Zombie and Weapon tables
	  it { should belong_to(:zombie) }
	  it { should belong_to(:weapon) }
end
