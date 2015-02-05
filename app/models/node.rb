class Node < ActiveRecord::Base
  belongs_to :parent, class_name: 'Node'
  has_many :children, class_name: 'Node', foreign_key: :parent_id
  attr_accessible :level, :name, :position, :parent_id

  def self.sorted
    all.sort_by(&:rank)
  end

  def rank
    [level, ancestor_positions, position].flatten
  end

  def ancestor_positions
    return [] unless parent.present?

    parent.ancestor_positions + [parent.position]
  end
end
