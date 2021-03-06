class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  after_create :notify_owner

  field :confirmed, type: Boolean, default: false
  field :cancelled, type: Boolean, default: false

  has_one :report
  belongs_to :user
  belongs_to :request

  def confirm
    confirmed = true
    user.update_attribute(:last_donated, DateTime.now)
    self.save
  end

  def reported?
    report.present? ? true : false
  end

  def cancel
    cancelled = true
    self.save
  end

  def notify_owner
    UserMailer.new_reply_email(user, request).deliver
  end
end
