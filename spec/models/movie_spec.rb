require 'rails_helper'

describe Movie do

    describe '.find_similar_movies' do
        let!(:movie1) { FactoryBot.create(:movie, title: 'The Dark Knight', director: 'Christopher Nolan') }
        let!(:movie3) { FactoryBot.create(:movie, title: "Interstellar", director: 'Christopher Nolan') }
        let!(:movie2) { FactoryBot.create(:movie, title: 'Avengers: Infinity War', director: 'Anthony Russo') }
        let!(:movie4) { FactoryBot.create(:movie, title: "Harry Potter") }

        context 'director exists' do
            it 'finds similar movies correctly' do
                expect(Movie.find_similar_movies(movie1.title)).to eql(['The Dark Knight', "Interstellar"])
                expect(Movie.find_similar_movies(movie1.title)).to_not include(['Avengers: Infinity War'])
                expect(Movie.find_similar_movies(movie2.title)).to eql(['Avengers: Infinity War'])
            end
        end

        context 'director does not exist' do
            it 'handles sad path' do
                expect(Movie.find_similar_movies(movie4.title)).to eql(nil)
            end
        end
    end

end