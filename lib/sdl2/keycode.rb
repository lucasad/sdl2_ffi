require 'sdl2'
require 'sdl2/scancode'

module SDL2

  #typedef :int32, :keycode
  typedef :int32, :scancode

  SCANCODE_MASK = 1<<30

  def self.scancode_to_keycode(scancode)
    scancode | SCANCODE_MASK
  end

  module KEYCODE
    include EnumerableConstants
    UNKNOWN  =  0

    RETURN  =  "\r".bytes[0]
    ESCAPE  =  "\033".bytes[0]
    BACKSPACE  =  "\b".bytes[0]
    TAB  =  "\t".bytes[0]
    SPACE  =  ' '.bytes[0]
    EXCLAIM  =  '!'.bytes[0]
    QUOTEDBL  =  '"'.bytes[0]
    HASH  =  '#'.bytes[0]
    PERCENT  =  '%'.bytes[0]
    DOLLAR  =  '$'.bytes[0]
    AMPERSAND  =  '&'.bytes[0]
    QUOTE  =  '\''.bytes[0]
    LEFTPAREN  =  '('.bytes[0]
    RIGHTPAREN  =  ')'.bytes[0]
    ASTERISK  =  '*'.bytes[0]
    PLUS  =  '+'.bytes[0]
    COMMA  =  ','.bytes[0]
    MINUS  =  '-'.bytes[0]
    PERIOD  =  '.'.bytes[0]
    SLASH  =  '/'.bytes[0]
    N0  =  '0'.bytes[0]
    N1  =  '1'.bytes[0]
    N2  =  '2'.bytes[0]
    N3  =  '3'.bytes[0]
    N4  =  '4'.bytes[0]
    N5  =  '5'.bytes[0]
    N6  =  '6'.bytes[0]
    N7  =  '7'.bytes[0]
    N8  =  '8'.bytes[0]
    N9  =  '9'.bytes[0]
    COLON  =  ':'.bytes[0]
    SEMICOLON  =  ';'.bytes[0]
    LESS  =  '<'.bytes[0]
    EQUALS  =  '='.bytes[0]
    GREATER  =  '>'.bytes[0]
    QUESTION  =  '?'.bytes[0]
    AT  =  '@'.bytes[0]

    LEFTBRACKET  =  '['.bytes[0]
    BACKSLASH  =  "\\".bytes[0]
    RIGHTBRACKET  =  ']'.bytes[0]
    CARET  =  '^'.bytes[0]
    UNDERSCORE  =  '_'.bytes[0]
    BACKQUOTE  =  '`'.bytes[0]
    A  =  'a'.bytes[0]
    B  =  'b'.bytes[0]
    C  =  'c'.bytes[0]
    D  =  'd'.bytes[0]
    E  =  'e'.bytes[0]
    F  =  'f'.bytes[0]
    G  =  'g'.bytes[0]
    H  =  'h'.bytes[0]
    I  =  'i'.bytes[0]
    J  =  'j'.bytes[0]
    K  =  'k'.bytes[0]
    L  =  'l'.bytes[0]
    M  =  'm'.bytes[0]
    N  =  'n'.bytes[0]
    O  =  'o'.bytes[0]
    P  =  'p'.bytes[0]
    Q  =  'q'.bytes[0]
    R  =  'r'.bytes[0]
    S  =  's'.bytes[0]
    T  =  't'.bytes[0]
    U  =  'u'.bytes[0]
    V  =  'v'.bytes[0]
    W  =  'w'.bytes[0]
    X  =  'x'.bytes[0]
    Y  =  'y'.bytes[0]
    Z  =  'z'.bytes[0]

    CAPSLOCK  =  SDL2.scancode_to_keycode(SCANCODE::CAPSLOCK)

    F1  =  SDL2.scancode_to_keycode(SCANCODE::F1)
    F2  =  SDL2.scancode_to_keycode(SCANCODE::F2)
    F3  =  SDL2.scancode_to_keycode(SCANCODE::F3)
    F4  =  SDL2.scancode_to_keycode(SCANCODE::F4)
    F5  =  SDL2.scancode_to_keycode(SCANCODE::F5)
    F6  =  SDL2.scancode_to_keycode(SCANCODE::F6)
    F7  =  SDL2.scancode_to_keycode(SCANCODE::F7)
    F8  =  SDL2.scancode_to_keycode(SCANCODE::F8)
    F9  =  SDL2.scancode_to_keycode(SCANCODE::F9)
    F10  =  SDL2.scancode_to_keycode(SCANCODE::F10)
    F11  =  SDL2.scancode_to_keycode(SCANCODE::F11)
    F12  =  SDL2.scancode_to_keycode(SCANCODE::F12)

    PRINTSCREEN  =  SDL2.scancode_to_keycode(SCANCODE::PRINTSCREEN)
    SCROLLLOCK  =  SDL2.scancode_to_keycode(SCANCODE::SCROLLLOCK)
    PAUSE  =  SDL2.scancode_to_keycode(SCANCODE::PAUSE)
    INSERT  =  SDL2.scancode_to_keycode(SCANCODE::INSERT)
    HOME  =  SDL2.scancode_to_keycode(SCANCODE::HOME)
    PAGEUP  =  SDL2.scancode_to_keycode(SCANCODE::PAGEUP)
    DELETE  =  "\177".bytes[0]
    END_  =  SDL2.scancode_to_keycode(SCANCODE::END_)
    PAGEDOWN  =  SDL2.scancode_to_keycode(SCANCODE::PAGEDOWN)
    RIGHT  =  SDL2.scancode_to_keycode(SCANCODE::RIGHT)
    LEFT  =  SDL2.scancode_to_keycode(SCANCODE::LEFT)
    DOWN  =  SDL2.scancode_to_keycode(SCANCODE::DOWN)
    UP  =  SDL2.scancode_to_keycode(SCANCODE::UP)

    NUMLOCKCLEAR  =  SDL2.scancode_to_keycode(SCANCODE::NUMLOCKCLEAR)
    KP_DIVIDE  =  SDL2.scancode_to_keycode(SCANCODE::KP_DIVIDE)
    KP_MULTIPLY  =  SDL2.scancode_to_keycode(SCANCODE::KP_MULTIPLY)
    KP_MINUS  =  SDL2.scancode_to_keycode(SCANCODE::KP_MINUS)
    KP_PLUS  =  SDL2.scancode_to_keycode(SCANCODE::KP_PLUS)
    KP_ENTER  =  SDL2.scancode_to_keycode(SCANCODE::KP_ENTER)
    KP_1  =  SDL2.scancode_to_keycode(SCANCODE::KP_1)
    KP_2  =  SDL2.scancode_to_keycode(SCANCODE::KP_2)
    KP_3  =  SDL2.scancode_to_keycode(SCANCODE::KP_3)
    KP_4  =  SDL2.scancode_to_keycode(SCANCODE::KP_4)
    KP_5  =  SDL2.scancode_to_keycode(SCANCODE::KP_5)
    KP_6  =  SDL2.scancode_to_keycode(SCANCODE::KP_6)
    KP_7  =  SDL2.scancode_to_keycode(SCANCODE::KP_7)
    KP_8  =  SDL2.scancode_to_keycode(SCANCODE::KP_8)
    KP_9  =  SDL2.scancode_to_keycode(SCANCODE::KP_9)
    KP_0  =  SDL2.scancode_to_keycode(SCANCODE::KP_0)
    KP_PERIOD  =  SDL2.scancode_to_keycode(SCANCODE::KP_PERIOD)

    APPLICATION  =  SDL2.scancode_to_keycode(SCANCODE::APPLICATION)
    POWER  =  SDL2.scancode_to_keycode(SCANCODE::POWER)
    KP_EQUALS  =  SDL2.scancode_to_keycode(SCANCODE::KP_EQUALS)
    F13  =  SDL2.scancode_to_keycode(SCANCODE::F13)
    F14  =  SDL2.scancode_to_keycode(SCANCODE::F14)
    F15  =  SDL2.scancode_to_keycode(SCANCODE::F15)
    F16  =  SDL2.scancode_to_keycode(SCANCODE::F16)
    F17  =  SDL2.scancode_to_keycode(SCANCODE::F17)
    F18  =  SDL2.scancode_to_keycode(SCANCODE::F18)
    F19  =  SDL2.scancode_to_keycode(SCANCODE::F19)
    F20  =  SDL2.scancode_to_keycode(SCANCODE::F20)
    F21  =  SDL2.scancode_to_keycode(SCANCODE::F21)
    F22  =  SDL2.scancode_to_keycode(SCANCODE::F22)
    F23  =  SDL2.scancode_to_keycode(SCANCODE::F23)
    F24  =  SDL2.scancode_to_keycode(SCANCODE::F24)
    EXECUTE  =  SDL2.scancode_to_keycode(SCANCODE::EXECUTE)
    HELP  =  SDL2.scancode_to_keycode(SCANCODE::HELP)
    MENU  =  SDL2.scancode_to_keycode(SCANCODE::MENU)
    SELECT  =  SDL2.scancode_to_keycode(SCANCODE::SELECT)
    STOP  =  SDL2.scancode_to_keycode(SCANCODE::STOP)
    AGAIN  =  SDL2.scancode_to_keycode(SCANCODE::AGAIN)
    UNDO  =  SDL2.scancode_to_keycode(SCANCODE::UNDO)
    CUT  =  SDL2.scancode_to_keycode(SCANCODE::CUT)
    COPY  =  SDL2.scancode_to_keycode(SCANCODE::COPY)
    PASTE  =  SDL2.scancode_to_keycode(SCANCODE::PASTE)
    FIND  =  SDL2.scancode_to_keycode(SCANCODE::FIND)
    MUTE  =  SDL2.scancode_to_keycode(SCANCODE::MUTE)
    VOLUMEUP  =  SDL2.scancode_to_keycode(SCANCODE::VOLUMEUP)
    VOLUMEDOWN  =  SDL2.scancode_to_keycode(SCANCODE::VOLUMEDOWN)
    KP_COMMA  =  SDL2.scancode_to_keycode(SCANCODE::KP_COMMA)
    KP_EQUALSAS400  =  SDL2.scancode_to_keycode(SCANCODE::KP_EQUALSAS400)

    ALTERASE  =  SDL2.scancode_to_keycode(SCANCODE::ALTERASE)
    SYSREQ  =  SDL2.scancode_to_keycode(SCANCODE::SYSREQ)
    CANCEL  =  SDL2.scancode_to_keycode(SCANCODE::CANCEL)
    CLEAR  =  SDL2.scancode_to_keycode(SCANCODE::CLEAR)
    PRIOR  =  SDL2.scancode_to_keycode(SCANCODE::PRIOR)
    RETURN2  =  SDL2.scancode_to_keycode(SCANCODE::RETURN2)
    SEPARATOR  =  SDL2.scancode_to_keycode(SCANCODE::SEPARATOR)
    OUT  =  SDL2.scancode_to_keycode(SCANCODE::OUT)
    OPER  =  SDL2.scancode_to_keycode(SCANCODE::OPER)
    CLEARAGAIN  =  SDL2.scancode_to_keycode(SCANCODE::CLEARAGAIN)
    CRSEL  =  SDL2.scancode_to_keycode(SCANCODE::CRSEL)
    EXSEL  =  SDL2.scancode_to_keycode(SCANCODE::EXSEL)

    KP_00  =  SDL2.scancode_to_keycode(SCANCODE::KP_00)
    KP_000  =  SDL2.scancode_to_keycode(SCANCODE::KP_000)
    THOUSANDSSEPARATOR  =  SDL2.scancode_to_keycode(SCANCODE::THOUSANDSSEPARATOR)
    DECIMALSEPARATOR  =  SDL2.scancode_to_keycode(SCANCODE::DECIMALSEPARATOR)
    CURRENCYUNIT  =  SDL2.scancode_to_keycode(SCANCODE::CURRENCYUNIT)
    CURRENCYSUBUNIT  =  SDL2.scancode_to_keycode(SCANCODE::CURRENCYSUBUNIT)
    KP_LEFTPAREN  =  SDL2.scancode_to_keycode(SCANCODE::KP_LEFTPAREN)
    KP_RIGHTPAREN  =  SDL2.scancode_to_keycode(SCANCODE::KP_RIGHTPAREN)
    KP_LEFTBRACE  =  SDL2.scancode_to_keycode(SCANCODE::KP_LEFTBRACE)
    KP_RIGHTBRACE  =  SDL2.scancode_to_keycode(SCANCODE::KP_RIGHTBRACE)
    KP_TAB  =  SDL2.scancode_to_keycode(SCANCODE::KP_TAB)
    KP_BACKSPACE  =  SDL2.scancode_to_keycode(SCANCODE::KP_BACKSPACE)
    KP_A  =  SDL2.scancode_to_keycode(SCANCODE::KP_A)
    KP_B  =  SDL2.scancode_to_keycode(SCANCODE::KP_B)
    KP_C  =  SDL2.scancode_to_keycode(SCANCODE::KP_C)
    KP_D  =  SDL2.scancode_to_keycode(SCANCODE::KP_D)
    KP_E  =  SDL2.scancode_to_keycode(SCANCODE::KP_E)
    KP_F  =  SDL2.scancode_to_keycode(SCANCODE::KP_F)
    KP_XOR  =  SDL2.scancode_to_keycode(SCANCODE::KP_XOR)
    KP_POWER  =  SDL2.scancode_to_keycode(SCANCODE::KP_POWER)
    KP_PERCENT  =  SDL2.scancode_to_keycode(SCANCODE::KP_PERCENT)
    KP_LESS  =  SDL2.scancode_to_keycode(SCANCODE::KP_LESS)
    KP_GREATER  =  SDL2.scancode_to_keycode(SCANCODE::KP_GREATER)
    KP_AMPERSAND  =  SDL2.scancode_to_keycode(SCANCODE::KP_AMPERSAND)
    KP_DBLAMPERSAND  =  SDL2.scancode_to_keycode(SCANCODE::KP_DBLAMPERSAND)
    KP_VERTICALBAR  =  SDL2.scancode_to_keycode(SCANCODE::KP_VERTICALBAR)
    KP_DBLVERTICALBAR  =  SDL2.scancode_to_keycode(SCANCODE::KP_DBLVERTICALBAR)
    KP_COLON  =  SDL2.scancode_to_keycode(SCANCODE::KP_COLON)
    KP_HASH  =  SDL2.scancode_to_keycode(SCANCODE::KP_HASH)
    KP_SPACE  =  SDL2.scancode_to_keycode(SCANCODE::KP_SPACE)
    KP_AT  =  SDL2.scancode_to_keycode(SCANCODE::KP_AT)
    KP_EXCLAM  =  SDL2.scancode_to_keycode(SCANCODE::KP_EXCLAM)
    KP_MEMSTORE  =  SDL2.scancode_to_keycode(SCANCODE::KP_MEMSTORE)
    KP_MEMRECALL  =  SDL2.scancode_to_keycode(SCANCODE::KP_MEMRECALL)
    KP_MEMCLEAR  =  SDL2.scancode_to_keycode(SCANCODE::KP_MEMCLEAR)
    KP_MEMADD  =  SDL2.scancode_to_keycode(SCANCODE::KP_MEMADD)
    KP_MEMSUBTRACT  =         SDL2.scancode_to_keycode(SCANCODE::KP_MEMSUBTRACT)
    KP_MEMMULTIPLY  =         SDL2.scancode_to_keycode(SCANCODE::KP_MEMMULTIPLY)
    KP_MEMDIVIDE  =  SDL2.scancode_to_keycode(SCANCODE::KP_MEMDIVIDE)
    KP_PLUSMINUS  =  SDL2.scancode_to_keycode(SCANCODE::KP_PLUSMINUS)
    KP_CLEAR  =  SDL2.scancode_to_keycode(SCANCODE::KP_CLEAR)
    KP_CLEARENTRY  =  SDL2.scancode_to_keycode(SCANCODE::KP_CLEARENTRY)
    KP_BINARY  =  SDL2.scancode_to_keycode(SCANCODE::KP_BINARY)
    KP_OCTAL  =  SDL2.scancode_to_keycode(SCANCODE::KP_OCTAL)
    KP_DECIMAL  =  SDL2.scancode_to_keycode(SCANCODE::KP_DECIMAL)
    KP_HEXADECIMAL  =         SDL2.scancode_to_keycode(SCANCODE::KP_HEXADECIMAL)

    LCTRL  =  SDL2.scancode_to_keycode(SCANCODE::LCTRL)
    LSHIFT  =  SDL2.scancode_to_keycode(SCANCODE::LSHIFT)
    LALT  =  SDL2.scancode_to_keycode(SCANCODE::LALT)
    LGUI  =  SDL2.scancode_to_keycode(SCANCODE::LGUI)
    RCTRL  =  SDL2.scancode_to_keycode(SCANCODE::RCTRL)
    RSHIFT  =  SDL2.scancode_to_keycode(SCANCODE::RSHIFT)
    RALT  =  SDL2.scancode_to_keycode(SCANCODE::RALT)
    RGUI  =  SDL2.scancode_to_keycode(SCANCODE::RGUI)

    MODE  =  SDL2.scancode_to_keycode(SCANCODE::MODE)

    AUDIONEXT  =  SDL2.scancode_to_keycode(SCANCODE::AUDIONEXT)
    AUDIOPREV  =  SDL2.scancode_to_keycode(SCANCODE::AUDIOPREV)
    AUDIOSTOP  =  SDL2.scancode_to_keycode(SCANCODE::AUDIOSTOP)
    AUDIOPLAY  =  SDL2.scancode_to_keycode(SCANCODE::AUDIOPLAY)
    AUDIOMUTE  =  SDL2.scancode_to_keycode(SCANCODE::AUDIOMUTE)
    MEDIASELECT  =  SDL2.scancode_to_keycode(SCANCODE::MEDIASELECT)
    WWW  =  SDL2.scancode_to_keycode(SCANCODE::WWW)
    MAIL  =  SDL2.scancode_to_keycode(SCANCODE::MAIL)
    CALCULATOR  =  SDL2.scancode_to_keycode(SCANCODE::CALCULATOR)
    COMPUTER  =  SDL2.scancode_to_keycode(SCANCODE::COMPUTER)
    AC_SEARCH  =  SDL2.scancode_to_keycode(SCANCODE::AC_SEARCH)
    AC_HOME  =  SDL2.scancode_to_keycode(SCANCODE::AC_HOME)
    AC_BACK  =  SDL2.scancode_to_keycode(SCANCODE::AC_BACK)
    AC_FORWARD  =  SDL2.scancode_to_keycode(SCANCODE::AC_FORWARD)
    AC_STOP  =  SDL2.scancode_to_keycode(SCANCODE::AC_STOP)
    AC_REFRESH  =  SDL2.scancode_to_keycode(SCANCODE::AC_REFRESH)
    AC_BOOKMARKS  =  SDL2.scancode_to_keycode(SCANCODE::AC_BOOKMARKS)

    BRIGHTNESSDOWN  =         SDL2.scancode_to_keycode(SCANCODE::BRIGHTNESSDOWN)
    BRIGHTNESSUP  =  SDL2.scancode_to_keycode(SCANCODE::BRIGHTNESSUP)
    DISPLAYSWITCH  =  SDL2.scancode_to_keycode(SCANCODE::DISPLAYSWITCH)
    KBDILLUMTOGGLE  =         SDL2.scancode_to_keycode(SCANCODE::KBDILLUMTOGGLE)
    KBDILLUMDOWN  =  SDL2.scancode_to_keycode(SCANCODE::KBDILLUMDOWN)
    KBDILLUMUP  =  SDL2.scancode_to_keycode(SCANCODE::KBDILLUMUP)
    EJECT  =  SDL2.scancode_to_keycode(SCANCODE::EJECT)
    SLEEP = SDL2.scancode_to_keycode(SCANCODE::SLEEP)
  end   

  enum :keycode, KEYCODE.flatten_consts

  module KEYMOD
    include EnumerableConstants
    NONE = 0x0000
    LSHIFT = 0x0001
    RSHIFT = 0x0002
    LCTRL = 0x0040
    RCTRL = 0x0080
    LALT = 0x0100
    RALT = 0x0200
    LGUI = 0x0400
    RGUI = 0x0800
    NUM  = 0x1000
    CAPS = 0x2000
    MODE = 0x4000
    RESERVED =   0x8000
    CTRL = LCTRL|RCTRL
    SHIFT = LSHIFT|RSHIFT
    ALT = LALT|RALT
    GUI = LGUI|RGUI
  end

  enum :keymod, KEYMOD.flatten_consts

end