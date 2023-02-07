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
    local V, orb, j, g, gamma;
    orb:=[alpha];
    j:=1;
    V := [];
    for g in Elements(G) do
        Append(V, [0]);
    od;
    Add(V, One(G), Position(Elements(G), alpha));
    while j <= Length(orb) do
        gamma := orb[j];
        for g in GeneratorsOfGroup(G) do
            if not phi(gamma, g) in orb then
                Append(orb, [phi(gamma, g)]);
                Add(V, g^(-1), Position(Elements(G), phi(gamma, g)));
            fi;
        od;
        j:=j+1;
    od;
    return [V, orb];
end;