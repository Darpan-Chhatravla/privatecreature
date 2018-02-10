class IfscCode < ApplicationRecord
	#
	# validations
	#
	validates(
		:bank,
		presence: true,
		length: 0..255
	)

	validates(
		:branch,
		presence: true,
		length: 0..255
	)

	validates(
		:contact,
		length: 0..20
	)

  validates(
  	:city,
		presence: true,
		length: 0..100
  )

  validates(
  	:district,
		presence: true,
		length: 0..100
  )

  validates(
  	:state,
		presence: true,
		length: 0..100
  )

  #
  # STATIC VAR
  #
  IMPORT_HEADER = [
  									'BANK',
  									'IFSC',
  									'MICR',
  									'BRANCH',
  									'ADDRESS',
  									'CONTACT',
  									'CITY',
  									'DISTRICT',
  									'STATE'
  								]

  #
  # Class Methods
  #
  def self.ifsc_code_auto(query)
  	IfscCode.where("branch like ?", "%#{query}%")
  					.limit(10)
  					.map(&:to_json)
  end

  def to_json
  	{
  		id: 				  self.id,
  		branch_name:  self.auto_large_name
  	}
  end

 	def auto_large_name
 		"#{self.branch} - #{self.bank}"
 	end
end