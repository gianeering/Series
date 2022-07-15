#Author: Gianfranco Ponza, a.k.a GianProgrammer, gianeering, innerRot
#© 2022 Gianfranco Ponza. All rights reserved.

module Series
  export Properties,Σ,fact,bicoeff
  """
  -IN ORDER TO USE THE Σ FUNCTION CORRECTLY, YOU NEED TO KNOW WHICH KEYWORDS TO USE
  FOR EACH OPERATOR, AND SPECIAL FUNCTIONS.
  -ALSO, Σ! ONLY WORKS FOR SINGLE-VARIABLE INPUTS, REAL NUMBERS.DO NOT PUT A LETTER DIFFERENT THAN
  THE ONE YOU SPECIFIED IN THE PROPERTIES IN THE EXPRESSION OF THE SERIES.
  -YOU CAN USE BUILT-IN JULIA CONSTANTS.
  -FOR BUILT-IN JULIA CONSTANTS, HIT TAB ONCE AFTER TYPING IN REPL.
  -TO CALL THE FUNCTION, TYPE IN REPL \Sigma AND HIT TAB ONCE.
  LEGEND:
  1. +
  2. -
  3. /
  4. *
  5. fact(n)
  6. bincoeff(n,k)
  7. \euler (BUILT-IN JULIA CONSTANT)
  """

  struct Properties
    SeriesFrom::Int64
    SeriesTo::Int64
    SeriesVar::Char
    function Properties(from::Int64,to::Int64,var::Char)
      new(from,to,var)
    end
  end

  function Σ(expr::String,props::Properties,out::Real = 0)
    for i in props.SeriesFrom:props.SeriesTo
      out += eval(Meta.parse(replace(expr,props.SeriesVar=>i)))
    end
    return out
  end

  function fact(n::Int)
    n = abs(n)

    if n == 0
      return 1
    end

    return n*fact(n-1)
  end

  function bicoeff(n::Int,k::Int)

      if k == 0 || k == n || (k == 0 && n == 0)
          return 1
      end

      if k == 1 || k == (n-1)
          return n
      end

      if 0<=n<k
          return 0
      end

      return fact(n)/(fact(k)*fact(n-k))

  end

end
