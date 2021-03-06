require 'sdl2/stdinc'
require 'sdl2/rect'
require 'sdl2/window'
require 'sdl2/display'
require 'sdl2/surface'

#require 'sdl2/renderer'
#require 'sdl2/texture'
require 'sdl2/syswm/info'

module SDL2
  typedef :int, :display_index

  enum :window_flags, Window::FLAGS.flatten_consts
  # TODO: SDL_video.h lines 113~129
  enum :window_event_id, WINDOWEVENT.flatten_consts
  
  enum :windowpos, WINDOWPOS.flatten_consts
  
  typedef :pointer, :gl_context

  ##
  # OpenGL configuration attributes
  # For use with GlAttribute[xxx]
  module GLattr
    include EnumerableConstants
    RED_SIZE			                   = next_const_value
    GREEN_SIZE			                 = next_const_value
    BLUE_SIZE			                   = next_const_value
    ALPHA_SIZE			                 = next_const_value
    BUFFER_SIZE			                 = next_const_value
    DOUBLEBUFFER			               = next_const_value
    DEPTH_SIZE			                 = next_const_value
    STENCIL_SIZE			               = next_const_value  
    ACCUM_RED_SIZE		               = next_const_value
    ACCUM_GREEN_SIZE	               = next_const_value
    ACCUM_BLUE_SIZE		               = next_const_value
    ACCUM_ALPHA_SIZE	               = next_const_value
    STEREO			                     = next_const_value
    MULTISAMPLEBUFFERS               = next_const_value
    MULTISAMPLESAMPLES               = next_const_value                
    ACCELERATED_VISUAL               = next_const_value              
    RETAINED_BACKING	               = next_const_value
    CONTEXT_MAJOR_VERSION	           = next_const_value
    CONTEXT_MINOR_VERSION	           = next_const_value
    CONTEXT_EGL                      = next_const_value
    CONTEXT_FLAGS                    = next_const_value
    CONTEXT_PROFILE_MASK			       = next_const_value
    SHARE_WITH_CURRENT_CONTEXT       = next_const_value
  end
  
  # lines 165~190
  enum :gl_attr, GLattr.flatten_consts
  ##
  # An enumeration of OpenGL profiles
  module GLprofile
    include EnumerableConstants
    ##
    # OpenGL core profile - deprecated functions are disabled
    CORE = 0x0001
    ##
    # OpenGL compatibility profile - depreciated functions are allowed
    COMPATIBILITY = 0x0002
    ##
    # OpenGL ES profile - only a subset of the base OpenGL functionality is available
    ES = 0x0004
  end
  enum :gl_profile, GLprofile.flatten_consts
  ##
  # An enumeration of OpenGL Context configuration flags
  # See: https://wiki.libsdl.org/SDL_GLcontextFlag
  module GLcontextFlag
    include EnumerableConstants
    ##
    # See: https://wiki.libsdl.org/SDL_GLcontextFlag
    DEBUG = 0x001
    ##
    # See: https://wiki.libsdl.org/SDL_GLcontextFlag
    FORWARD_COMPATIBLE = 0x0002
    ##
    # See: https://wiki.libsdl.org/SDL_GLcontextFlag
    ROBUST_ACCESS = 0x0004
    ##
    # See: https://wiki.libsdl.org/SDL_GLcontextFlag
    RESET_ISOLATION = 0x0008
  end
  # lines 199~205
  enum :gl_context_flag, GLcontextFlag.flatten_consts

  ##
  # Abstraction of SDL's video interface.
  module Video
    ##
    # Abstract enumeration of SDL's VideoDrivers concept.
    module Drivers
      ##
      # Returns the number of video drivers available.
      def self.num
        SDL2.get_num_video_drivers!()
      end
      ##
      # Returns the name of the video driver
      def self.[](index)
        SDL2.get_video_driver(index)
      end
      ##
      # Enumerates the drivers
      def self.each(&block)
        self.lazy(&block)
      end
      ##
      # Constructs a ?lazy? enumerator
      def self.lazy(&block)
        self.num.times.lazy.map{|idx|self[idx]}.each(&block)
      end
    end
    ##
    # Initialize a specific video driver named or nil for default.
    def self.init(video_driver_name = nil)
      SDL2.video_init!(video_driver_name)
    end
    ##
    # Shut down Video subsystem
    def self.quit()
      SDL2.video_quit
    end
    ##
    # Resturns the current video driver
    def self.current_driver()
      SDL2.get_current_video_driver()
    end
  end
  
  ##
  # Interface to ScreenSaver control
  module ScreenSaver
    ##
    # Returns true if the ScreenSaver is enabled
    def self.enabled?
      SDL2.is_screen_saver_enabled?
    end
    ##
    # Attempts to turn off the ScreenSaver
    def self.disable
      SDL2.disable_screen_saver
    end
    ##
    # Attempts to restore the ScreenSaver
    def self.enable
      SDL2.enable_screen_saver
    end
  end
  # This interface represents SDL_video.h function prototypes, lines 208~
  api :SDL_GetNumVideoDrivers, [], :int, {error: true, filter: OK_WHEN_GTE_ZERO}
	api :SDL_GetVideoDriver, [:int], :string
	api :SDL_VideoInit, [:string], :int, {error: true, filter: OK_WHEN_ZERO}
	api :SDL_VideoQuit, [], :void
	api :SDL_GetCurrentVideoDriver, [], :string
	api :SDL_GetNumVideoDisplays, [], :int, {error: true, filter: OK_WHEN_GTE_ZERO}
	api :SDL_GetDisplayName, [:display_index], :string
	api :SDL_GetDisplayBounds, [:int, Rect.by_ref], :int
	api :SDL_GetNumDisplayModes, [:int], :int, {error: true, filter: OK_WHEN_GTE_ZERO}
	api :SDL_GetDisplayMode, [:int, :int, Display::Mode.by_ref], :int
	api :SDL_GetDesktopDisplayMode, [:int, Display::Mode.by_ref], :int
	api :SDL_GetCurrentDisplayMode, [:int, Display::Mode.by_ref], :int, {error: true, filter: OK_WHEN_ZERO} 
	api :SDL_GetClosestDisplayMode,  [:display_index, Display::Mode.by_ref, Display::Mode.by_ref], Display::Mode.by_ref, {error: true, filter: OK_WHEN_NOT_NULL}  
	api :SDL_GetWindowDisplayIndex, [Window.by_ref], :int
	api :SDL_SetWindowDisplayMode, [Window.by_ref, :uint32], :int
	api :SDL_GetWindowDisplayMode, [Window.by_ref, Display::Mode.by_ref], :int
	api :SDL_GetWindowPixelFormat, [Window.by_ref], :pixel_format
	api :SDL_CreateWindow, [:string, :int, :int, :int, :int, :window_flags], Window.ptr, {error: true, filter: OK_WHEN_NOT_NULL}
	api :SDL_CreateWindowFrom, [:pointer], Window.ptr
	api :SDL_GetWindowFromID, [:uint32], Window.ptr
	api :SDL_GetWindowID, [Window.by_ref], :uint32
	api :SDL_GetWindowFlags, [Window.by_ref], :uint32
	api :SDL_GetWindowTitle, [Window.by_ref], :string
	api :SDL_SetWindowTitle, [Window.by_ref, :string], :void
	api :SDL_SetWindowIcon, [Window.by_ref, Surface.by_ref], :void
	api :SDL_SetWindowData, [Window.by_ref, :string, :pointer], :pointer
	api :SDL_GetWindowData, [Window.by_ref, :string], :pointer
	api :SDL_SetWindowPosition, [Window.by_ref, :int, :int], :void
	api :SDL_GetWindowPosition, [Window.by_ref, TypedPointer::Int.by_ref, TypedPointer::Int.by_ref], :void
	api :SDL_SetWindowSize, [Window.by_ref, :int, :int], :void
	api :SDL_GetWindowSize, [Window.by_ref, TypedPointer::Int.by_ref, TypedPointer::Int.by_ref], :void
	api :SDL_SetWindowMaximumSize, [Window.by_ref, :int, :int], :void
	api :SDL_GetWindowMaximumSize, [Window.by_ref, TypedPointer::Int.by_ref, TypedPointer::Int.by_ref], :void
	api :SDL_SetWindowMinimumSize, [Window.by_ref, :int, :int], :void
	api :SDL_GetWindowMinimumSize, [Window.by_ref, TypedPointer::Int.by_ref, TypedPointer::Int.by_ref], :void
	api :SDL_SetWindowBordered, [Window.by_ref, :bool], :void
	api :SDL_ShowWindow, [Window.by_ref], :void
	api :SDL_HideWindow, [Window.by_ref], :void
	api :SDL_RaiseWindow, [Window.by_ref], :void
	api :SDL_MaximizeWindow, [Window.by_ref], :void
	api :SDL_MinimizeWindow, [Window.by_ref], :void
	api :SDL_RestoreWindow, [Window.by_ref], :void
	api :SDL_SetWindowFullscreen, [Window.by_ref, :uint32], :int
	api :SDL_GetWindowSurface, [Window.by_ref], Surface.by_ref
	api :SDL_UpdateWindowSurface, [Window.by_ref], :int, {error: true}
	api :SDL_UpdateWindowSurfaceRects, [Window.by_ref, Rect.by_ref, :int], :int, {error: true}
	api :SDL_GetWindowGrab, [Window.by_ref], :bool
	api :SDL_SetWindowGrab, [Window.by_ref, :bool], :void
	api :SDL_GetWindowBrightness, [Window.by_ref], :float
	api :SDL_SetWindowBrightness, [Window.by_ref, :float], :int
	api :SDL_GetWindowGammaRamp, [Window.by_ref, TypedPointer::UInt16.by_ref, TypedPointer::UInt16.by_ref, TypedPointer::UInt16.by_ref], :int
	api :SDL_SetWindowGammaRamp, [Window.by_ref, TypedPointer::UInt16.by_ref, TypedPointer::UInt16.by_ref, TypedPointer::UInt16.by_ref], :int
	api :SDL_DestroyWindow, [Window.by_ref], :void
	api :SDL_IsScreenSaverEnabled, [], :bool
	api :SDL_DisableScreenSaver, [], :void
	api :SDL_EnableScreenSaver, [], :void
	api :SDL_GL_LoadLibrary, [:string], :int
	api :SDL_GL_GetProcAddress, [:string], :pointer
	api :SDL_GL_UnloadLibrary, [], :void
	api :SDL_GL_ExtensionSupported, [:string], :bool
	api :SDL_GL_SetAttribute, [:gl_attr, TypedPointer::Int], :int
	api :SDL_GL_GetAttribute, [:gl_attr, TypedPointer::Int.by_ref], :int
	api :SDL_GL_CreateContext, [Window.by_ref], :gl_context
	api :SDL_GL_MakeCurrent, [Window.by_ref, :gl_context], :int
	api :SDL_GL_GetCurrentWindow, [], Window.by_ref
	api :SDL_GL_GetCurrentContext, [], :gl_context
	api :SDL_GL_SetSwapInterval, [:int], :int
	api :SDL_GL_GetSwapInterval, [], :int
	api :SDL_GL_DeleteContext, [:gl_context], :void
	api :SDL_GL_SwapWindow, [Window.by_ref], :void
end