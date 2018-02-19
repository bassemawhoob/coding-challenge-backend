class Zombie < ApplicationRecord
	has_many :zombie_armors, dependent: :destroy
	has_many :armors, through: :zombie_armors

	has_many :zombie_weapons, dependent: :destroy
	has_many :weapons, through: :zombie_weapons

	validates_presence_of :name, :hit_points, :brains_eaten, :speed, :turn_date

  	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  	scope :hit_points, -> (hit_points) { where hit_points: hit_points}
  	scope :brains_eaten, -> (brains_eaten) { where brains_eaten: brains_eaten}
  	scope :speed, -> (speed) { where speed: speed}
  	scope :turn_date, -> (turn_date) {where turn_date: Date.parse(turn_date)}
  	scope :weapons, -> (weapons) {joins(:zombie_weapons).where("zombie_weapons.weapon_id IN (?)", weapons)}
  	scope :armors, -> (armors) {joins(:zombie_armors).where("zombie_armors.armor_id IN (?)", armors)}
end
