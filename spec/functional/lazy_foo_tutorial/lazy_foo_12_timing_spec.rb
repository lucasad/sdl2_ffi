require_relative 'lazy_foo_helper'

require 'sdl2/ttf'
require 'bad_sdl/application'
#binding.pry
require 'bad_sdl/engine/block_engine'

#ORIGINAL: http://lazyfoo.net/SDL_tutorials/lesson12/index.php
# Adapted for Ruby & SDL 2.0 as functional test by BadQuanta

describe "LazyFoo.net: Lesson 12: Timing" do

  before do
    SDL2.init!(:EVERYTHING)
    @app = BadSdl::Application.new()

    @app.engines << @engine = BadSdl::Engine::BlockEngine.new

    @running = true
    @start = SDL2::get_ticks()
    
    TTF::init!
    @font = SDL2::TTF::Font.open(fixture('fonts/GaroaHackerClubeBold.otf'),64)    

    @app.on({type: :KEYDOWN, key: {keysym: {sym: :S}}}) do
      if @running == true
        @running = false
        @start = 0
      else
        @running = true
        @start = SDL2::get_ticks()
      end
    end

    @engine.painter = Proc.new do |surface|
      puts "Painting"
      if(@running)
        puts ticks = SDL2::get_ticks() - @start
        time = @font.render_text_blended((ticks/1000).to_s, {r: 255,g: 255,b: 255,a: 255})        
        surface.fill_rect(surface.rect, [0,0,0,255])
        time.blit_out(surface)
                
      end
      true
    end

  end

  after do
    SDL2.quit
  end

  it "works" do
    skip "don't know how I should test this..."
    @app.loop(nil, delay: 1000)
  end

end