class IfscCodesController < ApplicationController
	before_action :set_terms, only: [:auto_complete]
	before_action :set_attribute_values, only: [:find_attribute]
	before_action :set_searched_code, only: [:search_code]

	def index
		@search_id = nil
	end

	def auto_complete
		codes = IfscCode.ifsc_code_auto(@term)
		render json: codes, status: :ok
	end

	def search_code
    respond_to do |format|
			format.js
    end
	end

	def find_attribute
    respond_to do |format|
			format.js
    end
	end

	private
		def set_terms
			@term = params[:term] || ""
		end

		def set_attribute_values
			case params[:look_for]
			when "branch"
				@div_id    =  "branch_dd"
				@branch_dd =  IfscCode.where(
												"city like ? and bank like ?",
												"%#{params[:term]}%",
												"%#{params[:bank]}"
										  ).distinct
											 .order(:branch)
											 .pluck(:branch) rescue []
			when "state"
				@div_id    = 	"state_dd"
				@state_dd  = 	IfscCode.where(
												"bank like ?",
												"%#{params[:term]}%"
											).distinct
											 .order(:state)
											 .pluck(:state) rescue []
			when "city"
				@div_id    = 	"city_dd"
				@city_dd   = 	IfscCode.where(
												"state like ? and bank like ?",
												"%#{params[:term]}%",
												"%#{params[:bank]}%"
											).distinct
											 .order(:city)
											 .pluck(:city) rescue []
			end
		end

		def set_searched_code
			if params[:dropdown] == "true"
				@ifsc = IfscCode.where("
					bank LIKE ? AND 
					state LIKE ? AND 
					branch LIKE ? AND
					city LIKE ?",
					"%#{params[:bank]}%",
					"%#{params[:state]}%",
					"%#{params[:branch]}%",
					"%#{params[:city]}%"
				).limit(1).try(:first)
			else
				@ifsc = IfscCode.find_by_id(params[:search_id])
			end
		end
end