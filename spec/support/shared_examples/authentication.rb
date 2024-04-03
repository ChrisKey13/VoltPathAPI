RSpec.shared_examples 'a successful authentication' do
    it 'authenticates the user and returns a token' do
        expect(response).to have_http_status(:ok)
        expect(json['token']).not_to be_nil
    end
end
  
RSpec.shared_examples 'a failed authentication' do
    it 'returns an unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
    end
end
  
RSpec.shared_examples 'a valid token verification' do
    it 'decodes the token to reveal the correct user ID' do
        post '/auth/login', params: { email: user.email, password: 'password' }
        token = json['token']
        decoded_token = JwtService.decode(token)
    
        expect(decoded_token[:user_id]).to eq(user.id)
    end
end