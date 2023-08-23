%capacidade suporte
Kg = 1000;
Ka = 200; %100
K_a = 500
Ke = 300;

%parâmetros
epsilon = 21; %21500; %8000 a 35000 ovos, ou seja, uma média de 21500
phi = 1/ 273; %273 dias a 304, ou seja, uma média de 289 dias
mu = 0.8; %taxa de mortalidade de 67% dos girinos durante a metamorfose
gamma = 1/80; %taxa de nascimento dos escorpiões
beta = 0.1;
omega = 1/(13*365); %etmpo de vida dos sapos
alpha = 500;
t = 1095;

%conversões de unidades para adimensionalização do sistema (1o modelo)

epsilonBarra = (epsilon * Ka) / (Kg * phi);
muBarra = mu / phi;
Kbarra = Kg / Ka;
gammaBarra = gamma / phi;
omegaBarra = omega / phi;
betaBarra = (beta * Ka) / phi;

%condições iniciais

Sgo = 0;
Sao = 2;
Eo = 200;

%tEbarra = t * phi
tE = t;

%SgBarra = Sgo / Kg;
%SaBarra = Sao / Ka;
%Ebarra = Eo / alpha;


%P0: (0, 0 ,0)
SgP0 = 0;
SaP0 = 0;
Ep0 = 0;
%SolSistemaEst(SgP0,SaP0,Ep0,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha,tE)

%P1
SgP1 = 0;
SaP1 = 0;
Ep1 = Ke / alpha;
%SolSistemaEst(SgP1,SaP1,Ep1,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha,tE)

%P2
SgP2 = Ka*(epsilon*phi - omega*phi - omega*mu) / (phi * (epsilon*Ka + Kg*phi + mu*Kg));
SaP2 = Kg*(epsilon*phi - omega*phi - omega*mu) / (epsilon *(omega*Ka + Kg*phi));
Ep2 = 0;
%SolSistemaEst(SgP2,SaP2,Ep2,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha,tE)

%P3
SgP3 = Ka*(epsilon*phi - omega*phi - omega*mu) / (phi * (epsilon*Ka + Kg*phi + mu*Kg));
SaP3 = Kg*(epsilon*phi - omega*phi - omega*mu) / (epsilon *(omega*Ka + Kg*phi));
Ep3 = 0.002 * alpha;

res = SolSistemaOsc(SgP3,SaP3,Ep3,epsilon,phi,mu,Kg,Ka,Ke,omega,gamma,beta,alpha,tE)

%Calculando diferença na população de escorpião quando aumentamos a capacidade suporte dos sapos adultos
res2 = SolSistemaOsc(SgP3,SaP3,Ep3,epsilon,phi,mu,Kg,K_a,Ke,omega,gamma,beta,alpha,tE)
disp('Porcentagem da diferença da população de escorpiões:');
disp((res.ultimo_E - res2.ultimo_E) / res.ultimo_E);


%SolSistema(SgBarra,SaBarra,Ebarra,epsilonBarra,muBarra,Kbarra,omegaBarra,gammaBarra,betaBarra,alpha,Ke,tEbarra)

