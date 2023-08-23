function retval = atualizaKa(Ka,t)

  K_a = Ka*(1 + 0.4*cos(2*pi*t/365))

  retval = K_a

endfunction
