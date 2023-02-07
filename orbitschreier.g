# OrbitAndSchreierVector from group theory, chapter 2, alg 3
# inputs: 
# G         ,a fg group
# alpha     ,an element the group acts on
# phi       ,a group action from G on Omega
# Omega     ,a G-set

# returns:
# V         ,the schreier vector wrt alpha
# orb       ,the orbit of alpha

Orbitschreier := function(G, alpha, phi, Omega)
    local V, orb, j, g, gamma, w;
    orb:=[alpha];
    j:=1;
    V := [];
    for w in Omega do
        Append(V, [0]);
    od;
    Add(V, One(G), Position(Omega, alpha));
    while j <= Length(orb) do
        gamma := orb[j];
        for g in GeneratorsOfGroup(G) do
            if not phi(gamma, g) in orb then
                Append(orb, [phi(gamma, g)]);
                V[Position(Omega, phi(gamma, g))] := g^(-1);
            fi;
        od;
        j:=j+1;
    od;
    return [V, orb];
end;