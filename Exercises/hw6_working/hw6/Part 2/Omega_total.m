function [Omega] = Omega_total(z, m_not ,z0, R, a, Q, z_ref, M, N_coef, W0, C)

Omega = -W0*z  + C;
for m = 1:M
    if m ~= m_not
        Z = BZ_of_z(z,z0(m),R(m));
        Omega = Omega + Omega_lake(Z,z,a(m,:),Q(m),z_ref,z0(m),N_coef);
    end
end

end

