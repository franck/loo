class User < ActiveRecord::Base
  acts_as_authorization_subject
  acts_as_authentic do |c|
    acts_as_authentic
  end
  
  def roles
    self.role_objects.map(&:name).join(", ")
  end  
end
