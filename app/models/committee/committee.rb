class Committee < ActiveRecord::Base
  has_one :parent, :class_name => "Committee", :foreign_key => "votesmart_id", :primary_key => "votesmart_parent_id"
  belongs_to :legislature
  has_many :committee_memberships
  has_many :members, :through => :committee_memberships, :source => :person
  
  def to_param
    [id, name.parameterize].join('-')
  end

  def type_fm
    case votesmart_type_id
    when 'S':
      'Senate'
    when 'H':
      'House'
    when 'J':
      'Joint'
    end
  end

end