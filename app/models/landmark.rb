class Landmark <ActiveRecord::Base
	belongs_to :figure

	validates :name, presence: true
end
