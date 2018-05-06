function [a,Q,C] = solve_lakes_fulit(Qx0,Phi0,Phi_lake,M,N,m,z0,R,chi_far,z_ref)
error=1e6;
NIT=0;
C=Phi0;
a=zeros(M,m+1);
Q_old=zeros(1,M);
erQmax=0;
eramax=0;
eramaxr=0;
a_old=a;
Qsum=0;
Q=zeros(1,M);
asum=zeros(1,M);
while error>1e-5 && NIT<100
    for mm=1:M
        a(mm,:)=-conj(Cauchy_integral_phi(N,m,@(chi)z_of_Z(chi,z0(mm),R(mm)),@(z)Omega_total(z,mm,z0,R,a,Q,z_ref,M,m,Qx0,C)));
    
        Q(mm)=2*pi*(Phi_lake(mm)+real(a(mm,1)))/log(1/abs(chi_far(mm)));
        C=Phi0-Omega_total(z_ref,0,z0,R,a,Q,z_ref,M,m,Qx0,0);
        erQ=abs(Q(mm)-Q_old(mm));
        Qsum=Qsum+abs(Q(mm));
        if erQ>erQmax
            erQmax=erQ;
        end
    end
    for mm=1:M
        for kk=1:m+1
            era=abs(a(mm,kk)-a_old(mm,kk));
            asum(mm)=asum(mm)+abs(a(mm,kk));
            if era>eramax
                eramax=era;
            end
        end
        erar=M*eramax/asum(mm);
        if erar>eramaxr
            eramaxr=erar;
        end
    end
    NIT=NIT+1
    erQmaxr=M*abs(erQmax/Qsum);
    if erQmaxr>eramaxr
        error=erQmaxr;
    else
        error=eramaxr;
    end
    error
    a_old=a;
    Q_old=Q;
    Qsum=0;
    asum=zeros(1,M);
    erQmax=0;
    eramax=0;
    eramaxr=0;
end
end
