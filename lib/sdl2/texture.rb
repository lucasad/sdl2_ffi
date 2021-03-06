require 'sdl2'
# Stub for now.. need to implement!!!
module SDL2
  class Texture < FFI::Struct
    layout :magic, :pointer,
      :format, :uint32,
      :access, :int,
      :w, :int,
      :h, :int,
      :mod_mode, :int,
      :blend_mode, :blend_mode,
      :r, :uint8,
      :g, :uint8,
      :b, :uint8,
      :a, :uint8,
      :renderer, :pointer,
      :native, :pointer,
      :yuv, :pointer, #TODO: Review SDL_SW_YUVTexture
      :pixels, :pointer,
      :pitch, :int,
      :locked_rect, :pointer,
      :driverdata, :pointer,
      :prev, :pointer,
      :next, :pointer
      
    ##
    # Ensures the texture is properly disposed of
    def self.release(pointer)
      SDL2.destroy_texture(pointer)
    end
    ##
    # Constructs a texture within a renderer
    def self.create(renderer, format, access, w, h)
      SDL2.create_texture!(renderer, format, access, w, h)
    end
    ##
    # Destroy this texture
    def destroy
      SDL2.destroy_texture(self)
    end
    ##
    # Returns the alpha modulation (0~255)
    def alpha_mod
      alpha = SDL2::TypedPointer::UInt8.new
      SDL2.get_texture_alpha_mod!(self, alpha)
      alpha.value
    end
    ##
    # Sets the alpha modulation (0~255)
    def alpha_mod=(uInt8)
      SDL2.set_texture_alpha_mod!(self, uInt8)
    end
    ##
    # Returns the blend mode 
    #NOTE: This will be a symbol of the constant value.
    def blend_mode
      blend_mode = SDL2::TypedPointer::BlendMode.new
      SDL2.get_texture_blend_mode!(self, blend_mode)
      blend_mode.value
    end
    ##
    # Accepts a new blend mode value.
    # NOTE: Accepts symbol or SDL2::BLENDMODE constant values.
    def blend_mode=(blend_mode)
      SDL2.set_texture_blend_mode!(self, blend_mode)
    end
    ##
    # Returns the color modulation, an array of 3 integers (0~255)
    def color_mod
      colors = 3.times.map{SDL2::TypedPointer::UInt8.new}
      SDL2.get_texture_color_mod!(self, *colors)
      colors.map(&:value)
    end
    ##
    # Sets the color modulation, expects an array of 3 integers (0~255)
    def color_mod=(colors)
      raise "At least 3 for RGB, not #{colors.count}" if colors.count < 3
      SDL2.set_texture_color_mod!(self, *colors.first(3))
      colors
    end
    ##
    # Lock a portion (or all) of a texture for write access
    # Returns: [pointer, pitch]
    #   pointer - An FFI::Pointer to the locked pixels
    #   pitch - An integer pitch value 
    def lock(rect = nil)
      pointer = SDL2::TypedPointer::Pointer.new
      pitch   = SDL2::TypedPointer::Int.new
      SDL2.lock_texture!(self, rect, pointer, pitch)
      [pointer.value, pitch.value]
    end
    ##
    # Unlock 
    def unlock()
      SDL2.unlock_texture(self)
    end
    ##
    # Query the texture about itself:
    # Returns: [format, access, w, h]
    #   format - An SDL2::PIXELFORMAT value
    #   access - AN SDL2::TEXTUREACCESS value
    #   w      - an integer representing the width
    #   h      - an integer representing the height
    def query()
      query = [
        SDL2::TypedPointer::PixelFormat.new,
        SDL2::TypedPointer::TextureAccess.new,
        SDL2::TypedPointer::Int.new,
        SDL2::TypedPointer::Int.new
      ]
      SDL2.query_texture!(self, *query)
      query.map(&:value)
    end
  end
end