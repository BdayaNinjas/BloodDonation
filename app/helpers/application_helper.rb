module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end
  def blood_types
    BloodType.all.map{ |b| [b.type, b.id]}
  end

  	 def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
