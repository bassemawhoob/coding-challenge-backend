require 'rails_helper'

RSpec.describe ZombieArmor, type: :model do
	  # Association test
	  # ensure an ZombieArmor is a many-to-many table for Zombie and Armor tables
	  it { should belong_to(:zombie) }
	  it { should belong_to(:armor) }
end
