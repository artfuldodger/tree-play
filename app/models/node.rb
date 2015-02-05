class Node < ActiveRecord::Base
  belongs_to :parent, class_name: 'Node'
  has_many :children, class_name: 'Node', foreign_key: :parent_id
  attr_accessible :level, :name, :position, :parent_id

  def self.sorted
    all.sort_by(&:rank)
  end

  def rank
    [level, ancestors_weight, position]
  end

  def weight
    Math.exp(level) * position
  end

  def ancestors_weight
    return 0 unless parent.present?

    parent.weight + parent.ancestors_weight
  end
end
