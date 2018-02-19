class ZombiesController < ApplicationController
	before_action :set_zombie, only: [:show, :update, :destroy]

	# GET /zombies
	def index
		@zombies = Zombie.all
		@zombies = @zombies.starts_with(params[:name]) if params[:name].present?
		@zombies = @zombies.hit_points(params[:hit_points]) if params[:hit_points].present?
		@zombies = @zombies.brains_eaten(params[:brains_eaten]) if params[:brains_eaten].present?
		@zombies = @zombies.speed(params[:speed]) if params[:speed].present?
		@zombies = @zombies.turn_date(params[:turn_date]) if params[:turn_date].present?
		@zombies = @zombies.weapons(params[:weapons].split(',')) if params[:weapons].present?
		@zombies = @zombies.armors(params[:armors].split(',')) if params[:armors].present?
		json_response(@zombies)
	end

	# POST /zombies
	def create
		@zombie = Zombie.create!(zombie_params)
		json_response(@zombie, :created)
	end

	# GET /zombies/:id
	def show
		json_response(@zombie)
	end

	# PUT /zombies/:id
	def update
		@zombie.update(zombie_params)
		head :no_content
	end

	# DELETE /zombies/:id
	def destroy
		@zombie.destroy
		head :no_content
	end

	private

	def zombie_params
		params.permit(:id, :name, :hit_points, :brains_eaten, :speed, :turn_date, weapon_ids: [], armor_ids: [])
	end

	def set_zombie
		@zombie = Zombie.find(params[:id])
	end
end
