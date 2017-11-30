require 'PArrayRange'

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
      __pforall_hash__( self, false, opts, &b )
    end

    def peach_pair

    end

    def pmap

    end

    def preduce

    end

    private
    # Itere un bloc, en parallele, sur les differents elements d'un tableau.
    #
    # @option (see #peach)
    # @param [Array] resultat Dans quel tableau doivent etre conserves les elements du resultat
    # @param [Symbol] given_by :default si on applique le bloc sur un element <array>
    # du genre [key,value], :pair si on applique sur deux variables |k,v|, ou uniquement :key ou :value pour la valeur
    # @param b Le bloc a executer
    #
    # @return Le tableau initial si resultat.eql? self, sinon un autre tableau: voir les methodes publiques
    #
    # @raise [DBC::Failure] Divers conditions selon les options
    #
    def __pforall_hash__( resultat, given_by, opts = {}, &b )
      return resultat if size == 0

      method, opts = __analyser_arguments__( resultat, opts )

      # On applique maintenant la methode d'iteration approprie a
      # chacun des elements du tableau associatif, en yieldant au bloc recu en
      # argument.
      send method, *opts, given_by, &b

      resultat
    end


  end

  # On etend les module Hash avec les methodes ainsi definies.
  Hash.send(:include, PRuby::PHash)
end
