function res = SolSistema(SgBarra,SaBarra,Ebarra,epsilonBarra,muBarra,Kbarra,omegaBarra,gammaBarra,betaBarra,alpha,Ke,tf)

    % Obtendo os parâmetros da função 'rate'
    rate2 = @(t,Y) rate(t,Y,epsilonBarra,muBarra,Kbarra,omegaBarra,gammaBarra,betaBarra,alpha,Ke);

    % Resolvendo a EDO
    [T,Y] = ode23s(rate2,[0,tf],[SgBarra,SaBarra,Ebarra]);

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

function res = rate(t,Y,epsilonBarra,muBarra,Kbarra,omegaBarra,gammaBarra,betaBarra,alpha,Ke)

    %Desencapsulando o vetor que contém as variáveis dependentes
    sg = Y(1);
    sa = Y(2);
    e = Y(3);

    % Calculando as taxas de variação (derivadas)
    dSgdt = epsilonBarra*sa*(1-sg) - sg - muBarra*sg;
    dSadt = Kbarra*sg*(1-sa) - omegaBarra*sa;
    dEdt = alpha*e*(gammaBarra*(1 - alpha*e / Ke) - betaBarra*sa*e/(alpha*(1 + e*e)));

    % Encapsulando as taxas (derivadas)
    res = [dSgdt;dSadt;dEdt];
endfunction
