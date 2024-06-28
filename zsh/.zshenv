# Update PATH variable
typeset -U PATH path



# Input method configuration
#export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"


export ANKI_WAYLAND=1

# Uncomment the following line to use the qtq6 platform theme
# export QT_QPA_PLATFORMTHEME=qtq6

# Desktop environment settings
export XDG_CURRENT_DESKTOP=hyprland
export XDG_SESSION_DESKTOP=hyprland

# Data directories
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/

# Package configuration paths
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/lib64/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/share/pkgconfig:$PKG_CONFIG_PATH"

# Graphics settings
export AMD_VULKAN_ICD=RADV
export DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1

# Uncomment the following line to always use software rendering for OpenGL
# export LIBGL_ALWAYS_SOFTWARE=1

