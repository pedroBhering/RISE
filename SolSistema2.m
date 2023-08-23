function res = SolSistema2(Sgo,Sao,Eo,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha,tE)

  % Obtendo os parâmetros da função 'rate'
    rate2 = @(t,Y) rate(t,Y,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha);

    % Resolvendo a EDO
    [T,Y] = ode23s(rate2,[0,tE],[Sgo,Sao,Eo]);

    Sg = Y(:,1);
    Sa = Y(:,2);
    E = Y(:,3);

    % Plotando os gráficos com os resultados
    hold on
    plot(T,Sg,'-k')
    plot(T,Sa,'-r')
    plot(T,E,'-b')
    xlabel('Tempo [dias]')
    ylabel('Numero de individuos')
    legend('Sg','Sa','E')
endfunction

function res = rate(t,Y,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha)

    %Desencapsulando o vetor que contém as variáveis dependentes
    sg = Y(1);
    sa = Y(2);
    e = Y(3);

    K_g = atualizaKg(Kg,t)
    K_a = atualizaKa(Ka,t)

    % Calculando as taxas de variação (derivadas)
    dSgdt = epsilon * sa * (1 - sg / K_g) - phi * sg - mu * sg;
    dSadt = phi * sg * (1 - sa / K_a) - omega * sa;
    dEdt = gamma * e * (1 - e / Ke) - beta * sa * (power(e, 2) / (power(alpha, 2) + power(e, 2)));

    % Encapsulando as taxas (derivadas)
    res = [dSgdt;dSadt;dEdt];

endfunction
