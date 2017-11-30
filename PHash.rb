require 'array_range'

module PRuby

  ############################################################
  #
  # Definition des methodes paralleles qui s'appliquent
  # directement (et uniquement) a des Hash.
  #
  # Les methodes publiques sont les suivantes:
  # - peach
  # - peach_pair
  # - pmap
  # - preduce
  #
  # Ces methodes sont definies dans le present module, mais ensuite
  # la classe Hash est etendue avec ces methodes (via
  # des includes).
  #
  ############################################################
  module PHash
    def peach( opts = {}, &b )
      __pforall__( self, false, opts, &b )
    end

    def peach_pair

    end

    def pmap

    end

    def preduce

    end
  end

  # On etend les module Hash avec les methodes ainsi definies.
  Hash.send(:include, PRuby::PHash)
end
