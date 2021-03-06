require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end
  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album2 = Album.new("Giant Steps", nil, "2005", "rock", "Shon")
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, "2000", "punk","Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, "2000", "punk","Chee")
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#search') do
    it("searches for album by name") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      expect(Album.search("Giant Steps")).to(eq([album]))
    end
    it("searches for album by name") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      expect(Album.search("steps")).to(eq([album]))
    end
    it("searches for album by name") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      album3 = Album.new("Blue steps", nil, "2005", "rock", "Shon")
      album3.save()
      expect(Album.search("steps")).to(eq([album, album3]))
    end
  end

  describe('.sort') do
    it("sort all albums in alphabetical order") do
      album = Album.new("Blue", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Dog", nil, "2005", "rock", "Shon")
      album2.save()
      album3 = Album.new("Car", nil, "2005", "rock", "Shon")
      album3.save()
      album4 = Album.new("Apple", nil, "2003", "rock", "Chee")
      album4.save()
      expect(Album.format).to(eq([album4, album, album3, album2]))
    end
  end

  describe('#sold') do
    it("lists sold albums") do
      album = Album.new("Giant Steps", nil, "2000", "punk", "Chee")
      album.save()
      album2 = Album.new("Blue", nil, "2005", "rock", "Shon")
      album2.save()
      album3 = Album.new("Car", nil, "2005", "rock", "Shon")
      album3.save()
      album.sold
      expect(Album.all).to(eq([album2,album3]))
      expect(Album.all_sold).to(eq([album]))
    end
  end
end
