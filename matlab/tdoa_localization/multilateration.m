function multilateration

setup()
    
end


function setup(r0, r1) %r0 distances from sender one r1 distances from sender 2
    %find the two smallest r
    %smallest
    %rs0 = 
    %rs1 = 
    
    M0.x=0;
    M0.y=0;
    M0.z=0;
    
    M1.x=0;
    M1.y=rs0;
    M1.z=0;
    
    
    M2.x=-r1^2+r0^2+rs0^2;
    M2.x=M2.x/(2*rs0);
    M2.y=sqrt(rs2^2-M2.x^2);
    M2.z=0;
    
end
