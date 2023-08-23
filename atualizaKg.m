function retval = atualizaKg(Kg,t)

  K_g = Kg*(1 + 0.5*cos(2*pi*t/365))

  retval = K_g

endfunction
