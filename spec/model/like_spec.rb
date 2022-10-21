require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(user_id: 1, post_id: 1) }
  before { subject.save }

  it 'user_id should be presense' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be Integer' do
    expect(subject.user_id.class).to be Integer
  end

  it 'post_id should be presense' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be Integer' do
    expect(subject.post_id.class).to be Integer
  end
end
