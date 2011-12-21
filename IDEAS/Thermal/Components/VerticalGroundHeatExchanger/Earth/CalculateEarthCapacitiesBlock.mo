within IDEAS.Thermal.Components.VerticalGroundHeatExchanger.Earth;
function CalculateEarthCapacitiesBlock
// **************
// This function calculates an array of capacities..
// **************
// **************
// INPUT
// **************
// This represents the 1/10 of the total depth of the borehole (m)
input Modelica.SIunits.Length depthOfEarth[:];
// This is the specific heat capacity of the earth (J/(kg.K))
input Modelica.SIunits.SpecificHeatCapacity heatCapacitanceEarth[:];
// This is the density of the earth (kg/m�)
input Modelica.SIunits.Density densityEarth[:];
// This is the inner radius of the ring (m)
input Modelica.SIunits.Radius innerRadius[:];
// This is outer radius of the ring (m)
input Modelica.SIunits.Radius outerRadius[:];
input Modelica.SIunits.Radius radiusPipe;
// **************
// OUTPUT
// **************
// The heatcapacity of the earth (J/K)
output Modelica.SIunits.HeatCapacity capacity[size(depthOfEarth,1)+2];
algorithm
capacity[1] := Modelica.Constants.pi*depthOfEarth[1]*densityEarth[1]*heatCapacitanceEarth[1]*radiusPipe^2;
capacity[2] := Modelica.Constants.pi*depthOfEarth[1]*densityEarth[1]*heatCapacitanceEarth[1]*(innerRadius[1]^2-radiusPipe^2);
  for index in 1:size(depthOfEarth,1) loop
capacity[index+2] := Modelica.Constants.pi*depthOfEarth[index]*densityEarth[index]*heatCapacitanceEarth[index]*(outerRadius[index]^2-innerRadius[index]^2);
end for;
end CalculateEarthCapacitiesBlock;
