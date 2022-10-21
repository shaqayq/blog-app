require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(user_id: 1, title: 'test', text: 'Test title') }

  before { subject.save }

  it 'Title should be presense' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be presense' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be presene' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'user_id should be integer' do
    expect(subject.user_id.class).to be Integer
  end
end
