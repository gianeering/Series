module Series
  export Σ,bicoeff,fact

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

  struct Properties
    SeriesFrom::Int64
    SeriesTo::Int64
    SeriesVar::Char
    function Properties(from::Int64,to::Int64,var::Char)
      new(from,to,var)
    end
  end
end
