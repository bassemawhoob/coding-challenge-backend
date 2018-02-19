require 'rails_helper'

RSpec.describe 'Zombies API', type: :request do
  # initialize test data 
  let!(:zombies) { create_list(:zombie, 10) }
  let(:zombie_id) { zombies.first.id }

  # Test suite for GET /todos
  describe 'GET /zombies' do
    # make HTTP get request before each example
    before { get '/zombies' }
    it 'returns zombies' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /zombies/:id
  describe 'GET /zombies/:id' do
    before { get "/zombies/#{zombie_id}" }

    context 'when the record exists' do
      it 'returns the zombie' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(zombie_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:zombie_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Zombie/)
      end
    end
  end

  # Test suite for POST /zombies
  describe 'POST /zombies' do
    # valid payload
    let(:valid_attributes) { { name: 'Egyptian Beast', hit_points: '5', speed: '15', brains_eaten: '5', turn_date: DateTime.now.to_s } }

    context 'when the request is valid' do
      before { post '/zombies', params: valid_attributes }
      
      it 'creates a zombie' do
        expect(json['name']).to eq('Egyptian Beast')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/zombies', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Hit points can't be blank, Brains eaten can't be blank, Speed can't be blank, Turn date can't be blank/)
      end
    end
  end

  # Test suite for PUT /zombies/:id
  describe 'PUT /zombies/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/zombies/#{zombie_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /zombies/:id' do
    before { delete "/zombies/#{zombie_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
