require 'rails_helper'

describe 'Visior sees a genre show page' do 
  it 'they should see all songs of that gerne' do 
    artist = Artist.create(name: "Prince")
    genre = Genre.create(name: 'Jazz')
    song_1 = genre.songs.create(title: "Purple Rain", length: 209, play_count: 3445, artist_id: artist.id)
    song_2 = genre.songs.create(title: "Purple Haze", length: 209, play_count: 3445, artist_id: artist.id)
    song_3 = artist.songs.create(title: "Purple Snow", length: 209, play_count: 3445)
    
    visit genre_path(genre)
    
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to_not have_content(song_3.title)
  end 
end
    
    