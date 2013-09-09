
require 'sdl2'

module SDL2
  enum :glattr, [
    :red_size,
    :green_size,
    :blue_size,
    :alpha_size,
    :buffer_size,
    :doublebuffer,
    :depth_size,
    :stencil_size,
    :accum_red_size,
    :accum_green_size,
    :accum_blue_size,
    :accum_alpha_size,
    :stereo,
    :multisamplebuffers,
    :multisamplesamples,
    :accelerated_visual,
    :retained_backing,
    :context_major_version,
    :context_minor_version,
    :context_egl,
    :context_flags,    
    :context_profile_mask,
    :share_with_current_context  
  ]  
end