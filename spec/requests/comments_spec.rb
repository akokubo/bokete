require 'rails_helper'

RSpec.describe Comment, type: :request do
  let(:image) { Image.create(url: 'http://example.com', title: 'test') }

  # test from command line is
  # $ curl -X POST -d 'comment[body]=test' http://localhost:3000/images/1/comments.json
  describe 'POST /images/:id/comments.json' do
    it 'create comments' do
      post "/images/#{image.id}/comments.json", comment: { body: 'test' }
      expect(response.status).to be 201
    end
  end
end
