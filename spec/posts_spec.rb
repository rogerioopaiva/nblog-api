
describe 'nBlog Api' do
  before(:context) do
    Post.destroy_all
  end

  describe 'POST /posts' do
    describe 'status 200' do
      before do
        $req = { title: 'POST new Item', image: 'https://robohash.org/sitsequiquia.png?size=1280x960', body: Faker::Lorem.paragraph }
      end
      it 'creates a new post' do
        post 'api/posts', $req.to_json
        expect_status(200)
        $post_id = headers[:_id]
      end
    end
    describe 'GET /posts/:id' do
      describe 'status 200' do
        it 'post should be created' do
          get '/api/posts/' + $post_id
          expect_status(200)
          expect(json_body).to include(title: $req[:title], body: $req[:body])
        end
      end
    end
  end

  describe 'PUT /posts' do
    describe 'status 200' do
      before do
        req = { title: 'ITEM to PUT', image: 'https://robohash.org/sitsequiquia.png?size=1280x960', body: Faker::Lorem.paragraph }
        post 'api/posts', req.to_json
        $post = Post.where(title: req[:title]).first
      end
      it 'creates a new post' do
        $req = { title: 'ITEM to PUT Ok', body: Faker::Lorem.paragraph }
        put 'api/posts/' + $post[:_id].to_s, $req.to_json
        expect_status(200)
      end
    end
    describe 'GET /posts/:id' do
      describe 'status 200' do
        it 'post should be updated' do
          get '/api/posts/' + $post[:_id].to_s
          expect_status(200)
          expect(json_body).to include(title: $req[:title], body: $req[:body])
        end
      end
    end
  end

  describe 'GET /posts' do
    describe 'status 200' do
      it 'returns a list of posts' do
        get '/api/posts'
        expect_json_types('*', title: :string, body: :string)
        expect_status(200)
      end
    end
  end

  describe 'GET /posts/:id' do
    describe 'status 404' do
      it 'message error when post not exist' do
        get '/api/posts/' + Faker::Lorem.characters(25)
        expect_status(404)
        expect(json_body).to eq(message: 'Post Not Found')
      end
    end
  end

  describe 'GET /posts/:id' do
    describe 'status 200' do
      before do
        @posts = Post.all
        @item = @posts.sample
      end
      it 'returns one post' do
        get '/api/posts/' + @item[:_id].to_s
        expect_status(200)
        expect(json_body).to include(title: @item[:title], body: @item[:body])
      end
    end
  end

  describe 'DELETE /posts/:id' do
    describe 'status 200' do
      before do
        req = { title: 'ITEM to DELETE', image: 'https://robohash.org/sitsequiquia.png?size=1280x960', body: Faker::Lorem.paragraph }
        post 'api/posts', req.to_json
        $post = Post.where(title: req[:title]).first
      end
      it 'removes a post' do
        delete '/api/posts/' + $post[:_id].to_s
        expect_status(200)
      end
    end
    describe 'status 404' do
      it 'message error when post not exist' do
        delete '/api/posts/' + Faker::Lorem.characters(25)
        expect_status(404)
        expect(json_body).to eq(message: 'Post Not Found')
      end
    end
  end
end
