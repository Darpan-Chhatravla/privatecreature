module IfscGlobal
	#
	# Bank List
	#
	BANK_LIST   = IfscCode.all.distinct.order(:bank).pluck(:bank) rescue []
end