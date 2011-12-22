within IDEAS.Electric.DistributionGrid.GridSubModels;
model GridOnly3P
replaceable parameter IDEAS.Electric.Data.Interfaces.GridType
                                             grid(Pha=3)
    "Choose a grid Layout (with 3 phaze values)"
                                                annotation(choicesAllMatching = true);
IDEAS.Electric.BaseClasses.CPosPin[
                               4,Nodes] node
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
IDEAS.Electric.BaseClasses.CPosPin
                TraPin[3](i(
                          im(  each start=0)))
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
IDEAS.Electric.BaseClasses.CNegPin
                TraGnd
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));

  IDEAS.Electric.DistributionGrid.Components.Branch branch[3,Nodes](R=R3, X=X3);
  IDEAS.Electric.DistributionGrid.Components.Branch neutral[Nodes](R=
        Modelica.ComplexMath.real(Z), X=Modelica.ComplexMath.imag(Z));
  Modelica.SIunits.ActivePower PGriTot;
  Modelica.SIunits.ComplexPower SGriTot;
  Modelica.SIunits.ReactivePower QGriTot;
  Modelica.SIunits.ActivePower PGriTotPha[3];
  Modelica.SIunits.ComplexPower SGriTotPha[3];
  Modelica.SIunits.ReactivePower QGriTotPha[3];

  //parameter Boolean Loss = true
    //"if true, PLosBra and PGriLosTot gives branch and Grid losses";
  output Modelica.SIunits.ActivePower PLosBra[3,Nodes];
  output Modelica.SIunits.ActivePower PLosNeu[Nodes];
  output Modelica.SIunits.ActivePower PGriLosPha[3];
  output Modelica.SIunits.ActivePower PGriLosNeu;
  output Modelica.SIunits.ActivePower PGriLosPhaTot;
  output Modelica.SIunits.ActivePower PGriLosTot;

//protected
  parameter Integer Nodes=grid.n;
  parameter Integer T_matrix[Nodes,Nodes] = grid.T_matrix;
  parameter Modelica.SIunits.ComplexImpedance[Nodes] Z = grid.Z;
  parameter Modelica.SIunits.Resistance[3,Nodes] R3={Modelica.ComplexMath.real(Z) for i in 1:3};
  parameter Modelica.SIunits.Reactance[3,Nodes] X3={Modelica.ComplexMath.imag(Z) for i in 1:3};
//  parameter SI.ComplexVoltage[3] Vsource3={Vsource*(cos(c.pi*2*i/3)+MCM.j*sin(c.pi*2*i/6)) for i in 1:3};

 //Absolute voltages at the nodes
 output Modelica.SIunits.Voltage Vabs[3,Nodes];
equation
  /***Connecting all neutral connectors (=4th row of nodes)***/
  connect(TraGnd,neutral[1].p);
  for x in 1:Nodes loop
    for y in 1:Nodes loop
      if T_matrix[x,y]==1 then
        connect(neutral[x].p,node[4,y]);
      elseif T_matrix[x,y]==-1 then
        connect(neutral[x].n,node[4,y]);
      end if;
    end for;
  end for;
  /***Connecting all phases***/
  for z in 1:3 loop
    connect(TraPin,branch[:,1].p);
    for x in 1:Nodes loop
      for y in 1:Nodes loop
        if T_matrix[x,y]==1 then
          connect(branch[z,x].p,node[z,y]);
        elseif T_matrix[x,y]==-1 then
          connect(branch[z,x].n,node[z,y]);
        end if;
      end for;
    end for;
  end for;

/*** Calculating the absolute node voltages ***/
for z in 1:3 loop
    for x in 1:Nodes loop
      Vabs[z, x] = Modelica.ComplexMath.'abs'(node[z, x].v - node[4, x].v);
    end for;
end for;

/***Calculating all power phase powers***/
for z in 1:3 loop
    SGriTotPha[z] = (branch[z, 1].p.v - neutral[1].p.v)*
      Modelica.ComplexMath.conj(branch[z, 1].p.i);
    PGriTotPha[z] = Modelica.ComplexMath.real(SGriTotPha[z]);
    QGriTotPha[z] = Modelica.ComplexMath.imag(SGriTotPha[z]);
end for;
/***Calculating total power exchange at the transformer***/
PGriTot=ones(3)*PGriTotPha;
QGriTot=ones(3)*QGriTotPha;
  SGriTot = PGriTot + Modelica.ComplexMath.j*QGriTot;

//if Loss then
  for z in 1:3 loop
    for x in 1:Nodes loop
      PLosBra[z, x] = branch[z, x].R*(Modelica.ComplexMath.'abs'(branch[z, x].i))
        ^2;
    end for;
    PGriLosPha[z]=ones(Nodes)*PLosBra[z,:];
  end for;
  for x in 1:Nodes loop
    PLosNeu[x] = neutral[x].R*(Modelica.ComplexMath.'abs'(neutral[x].i))^2;
  end for;
  PGriLosNeu=ones(Nodes)*PLosNeu;
  PGriLosPhaTot=ones(3)*PGriLosPha;
  PGriLosTot=PGriLosPhaTot+PGriLosNeu;
//end if;

  annotation (Diagram(graphics), Icon(graphics={Bitmap(extent={{-100,100},{102,
              -100}}, fileName=
              "modelica://ELECTA/icon-ssnav-08-electricity.jpg")}));
end GridOnly3P;