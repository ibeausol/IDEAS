within IDEAS.Fluid.Sources;
model OutsideAirWindPressure
  "Outside boundary that takes temperature, humidity and CO2 from the SimInfoManager and that calculates wind-induced pressure"
  extends IDEAS.Fluid.Sources.BaseClasses.PartialSource(final verifyInputs=true);

  outer IDEAS.BoundaryConditions.SimInfoManager sim "SimInfoManager";

protected
  constant Integer s[:]= {
    if ( Modelica.Utilities.Strings.isEqual(string1=Medium.extraPropertiesNames[i],
                                            string2="CO2",
                                            caseSensitive=false))
    then 1 else 0 for i in 1:Medium.nC}
    "Vector with zero everywhere except where species is";

  Modelica.Blocks.Interfaces.RealInput T_in_internal(final unit="K",
                                                     displayUnit="degC")
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput h_internal = Medium.specificEnthalpy(
    Medium.setState_pTX(p_in_internal, T_in_internal, X_in_internal));

  IDEAS.BoundaryConditions.WeatherData.Bus bus;

  Modelica.Blocks.Interfaces.RealInput X_wEnv
    "Connector for X_wEnv";
  Modelica.Blocks.Routing.RealPassThrough p_link;
  Modelica.Blocks.Routing.RealPassThrough pSurf;
  Modelica.SIunits.Pressure pAtmPlusWind;
  Real Cp;
  Real Vwind;
equation
  connect(bus,sim.weaDatBus);

  connect(p_link.u, bus.pAtm);
  Cp = IDEAS.Airflow.Multizone.BaseClasses.windPressureLowRise(
    Cp0=0.6,
    G=0,
    incAng=0.25*Modelica.Constants.pi);
          // Need to set G as a parameter.
                                         // Need to set incAng as a parameter: surface inc and Vdir.
  Vwind = 0;
  pAtmPlusWind = p_link.y + Cp*0.5*1.2*Vwind^2;  // Need to set Vwind as a parameter.

  pSurf.u = pAtmPlusWind;
  connect(pSurf.y, p_in_internal);

  // must use sim.weaBus.Te for linearisation
  T_in_internal = sim.weaBus.Te;

  C_in_internal = {if i==1 then sim.CEnv.y  else 0 for i in s};

  // Check medium properties
  if Medium.nX>1 then
    Modelica.Fluid.Utilities.checkBoundary(Medium.mediumName, Medium.substanceNames,
      Medium.singleState, true, X_in_internal, "Boundary_pT");
  end if;
  if Medium.nX == 1 then
    X_in_internal = ones(Medium.nX);
  else
    X_in_internal = {X_wEnv, 1-X_wEnv};
  end if;

  connect(X_wEnv, bus.X_wEnv);
  connect(X_in_internal[1:Medium.nXi], Xi_in_internal);

  ports.C_outflow = fill(C_in_internal, nPorts);

  if not verifyInputs then
    h_internal    = Medium.h_default;
    p_in_internal = Medium.p_default;
    X_in_internal = Medium.X_default;
    T_in_internal = Medium.T_default;
  end if;

  // Assign medium properties
  connect(medium.h, h_internal);
  connect(medium.Xi, Xi_in_internal);

  for i in 1:nPorts loop
    ports[i].p          = p_in_internal;
    ports[i].h_outflow  = h_internal;
    ports[i].Xi_outflow = Xi_in_internal;
  end for;

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-98,100},{102,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,127,255}),
        Text(
          extent={{-150,110},{150,150}},
          textString="%name",
          lineColor={0,0,255}),
        Text(
          extent={{-60,-66},{78,72}},
          lineColor={238,46,47},
          textString="Sim.")}),
    Documentation(info="<html>
<p>
This model describes boundary conditions for
pressure, enthalpy, and CO2 that can be obtained
from weather data.
These data are obtained from the SimInfoManager,
which should be included in the model.
</p>
<p>
Note that boundary temperature,
mass fractions and trace substances have only an effect if the mass flow
is from the boundary into the port. If mass is flowing from
the port into the boundary, the boundary definitions,
with exception of boundary pressure, do not have an effect.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 21, 2019 by Filip Jorissen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OutsideAirWindPressure;
