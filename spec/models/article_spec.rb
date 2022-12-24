require 'rails_helper'

RSpec.describe Article do

  context "checks if correct data can be saved" do
    article1 = Article.new(title: 'I know')

    it 'should return data' do
      expect(article1.title).to eq('I know')
    end

    it 'should return no data' do
      expect(article1.body).to be nil
    end

    it 'is should have a body attribute' do
      article1.body = 'I know this is right'
      article1.save
      expect(article1.body).to eql('I know this is right')
    end
    
    it 'is able to save' do
      expect(Article.all.length).to eql(1)
    end
  end
end

RSpec.describe 'Articles details', type: :request do
  describe 'GET /articles' do
    before do
      get '/articles'
      @body = response.body
    end

    it 'should display available articles' do
      expect(@body.length).to be >  10
    end

    it 'should display articles without an error' do
      expect(@body.length).to be_truthy
    end

    it 'should display articles' do
      expect(@body.length).to be_truthy
    end

    it 'should display one of the articles save' do
      expect(@body).to include('I know')
    end
  end
end
