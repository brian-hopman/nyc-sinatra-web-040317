class Title <ActiveRecord::Base
	belongs_to :figure
	has_many :figure_titles
	has_many :figures, through: :figure_titles
end
