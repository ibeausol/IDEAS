within IDEAS.Thermal.Components.BaseClasses;
model FluidStreamConversionWater
  "Adaptor to connect a flow port of IDEAS with a fluid port of Modelica.Fluid for medium = liquid water"

  //Water used on the modelica standard library (MSL) side of the block.
  replaceable package MediumMSL =
        Modelica.Media.Water.StandardWater;

  //Partialsource is used to 'create' the modelica fluid
  extends Modelica.Fluid.Sources.BaseClasses.PartialSource(nPorts=1, redeclare
      package Medium =
        MediumMSL);

  //Medium used on the ideas side of the block.
  parameter IDEAS.Thermal.Data.Interfaces.Medium mediumIDEAS=IDEAS.Thermal.Data.Media.Water();
  //remaining default code from Boundary_pT
  parameter Medium.ExtraProperty C[Medium.nC](
       quantity=Medium.extraPropertiesNames)=fill(0, Medium.nC)
    "Fixed values of trace substances"
    annotation (Evaluate=true,
                Dialog(enable = (not use_C_in) and Medium.nC > 0));

  final Real tunTemp = -0.1
    "Tuning parameter to minimize the temperature error in the convertor. Default value for T_water=30degC";
  //remaining default code from Boundary_pT
protected
  Real X_in_internal[Medium.nX] = Medium.X_default
    "Needed to connect to conditional connector";
  Real C_in_internal[Medium.nC] "Needed to connect to conditional connector";

  // help variable to check the temperature error
  Modelica.SIunits.Temperature temperatureIDEAS;
  Modelica.SIunits.Temperature temperatureMSL;
public
  IDEAS.Thermal.Components.Interfaces.FlowPort_a[nPorts] portsIDEAS(each medium=mediumIDEAS)
    annotation (Placement(transformation(extent={{-110,-8},{-90,12}})));

equation
  //remaining default code from Boundary_pT
  Modelica.Fluid.Utilities.checkBoundary(Medium.mediumName, Medium.substanceNames,
    Medium.singleState, true, X_in_internal, "Boundary_pT");

  for i in 1:nPorts loop
    //mass flow and pressure linkage
    ports[i].m_flow+portsIDEAS[i].m_flow=0;
    ports[i].p = portsIDEAS[i].p;
    //enthalpy linkage if the mass flow goes from IDEAS to MSL
    ports[i].h_outflow = portsIDEAS[i].h-(273.15+tunTemp)*mediumIDEAS.cp;

    //setting H_outflow depending on flow direction: enthalpy linkage if the mass flow goes from MSL to IDEAS
     portsIDEAS[i].H_flow = semiLinear(
        portsIDEAS[i].m_flow,
        portsIDEAS[i].h,
        inStream(ports[i].h_outflow)+(273.15 +tunTemp)*mediumIDEAS.cp);

    temperatureIDEAS = portsIDEAS[i].h/mediumIDEAS.cp;
    temperatureMSL = Medium.temperature(Medium.setState_phX(ports[i].p, ports[i].h_outflow,ports[i].Xi_outflow));
    assert( noEvent(abs(temperatureIDEAS - temperatureMSL) < 0.5), "The temperature error introduced by the convertor component is too high ( " + String(abs(temperatureIDEAS - temperatureMSL)) + " K");
  end for;

  //remaining default code from Boundary_pT
  medium.Xi = X_in_internal[1:Medium.nXi];
  ports.C_outflow = fill(C_in_internal, nPorts);

  annotation (defaultComponentName="convertStream",
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Text(
          extent={{-150,52},{150,92}},
          lineColor={0,0,255},
          textString="%name"),
        Rectangle(
          extent={{0,40},{100,-40}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
                              Rectangle(
          extent={{-100,20},{0,-20}},
          lineColor={255,255,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{0,22},{100,-24}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255})}),
    Documentation(info="<html>
<p><br/>This block can be used to couple IDEAS blocks using flowPort (with flow variables) with Annex 60/Buildings/Modelica library blocks using flowPort (with flow + stream variables). Both flows have the same enthalpy and pressure and opposite mass flow rates. </p>
<p><h4>Description</h4></p>
<p>This block needs to connect flow variables to stream variables. The following figure illustrates the transfer of specific enthalpy and of enthalpy flow.</p>
<p><img src=\"modelica://IDEAS/Resources/convertor.PNG\"/></p>
<p>In the first case, when the water flows from IDEAS to MSL, <i>H </i>and <i>h </i>are given by the previous component (the pump) and should be assign to <i>ports.h_outflow</i>, the connector to MSL. <i>h_outflow </i> is only meaningfull, if <i>ports.m_flow &LT; 0  </i>i.e,  when the flows goes to MSL.</p>
<p>In the second case,  when the water flows from MSL to IDEAS, the inlet should be defined by the <i>inStream(h_outflow)</i>. This value is only meaningfull, if <i>ports.m_flow &GT; 0  </i>i.e,  when the flows goes to IDEAS, i.e. <i>portsIDEAS.m_flow &LT; 0</i>.</p>
<p><b>Verification</b> </p>
<p>Limited verification has been performed for water in <a href=\"modelica://IDEAS.Thermal.Components.Examples.FluidStreamConvertorWaterExample\">IDEAS.Thermal.Components.Examples.FluidStreamConvertorWaterExample</a> and <a href=\"modelica://IDEAS.Thermal.Components.Examples.Boiler_validation_a60_conversion\">IDEAS.Thermal.Components.Examples.Boiler_validation_a60_conversion</a>. </p>
<p><b>Limitations</b> </p>
<p><ul>
<li>The component defines equal enthalpy for in and outlet. However, due to a different specific heat capacity (<i>cp</i>) definition, the temperature calculation are not the same. The reference enthalpy is choosen in this convertor, in order to minimize the temperature error at T_water = 30 degC.</li>
<li>An assert function is added to check that the temperature error stays &LT; 0.5 degC. The convertor should be tuned differently, if an other medium is used.</li>
<li>This block introduces a computational overhead, although it remains limited. A performance comparison can be made using <a href=\"modelica://IDEAS.Thermal.Components.Examples.Boiler_validation_a60\">IDEAS.Thermal.Components.Examples.Boiler_validation_a60</a> and <a href=\"modelica://IDEAS.Thermal.Components.Examples.Boiler_validation_a60_conversion\">IDEAS.Thermal.Components.Examples.Boiler_validation_a60_conversion</a>. The conversions introduce an additional computational expense of around 20&percnt; in the _conversion example. </li>
</ul></p>
</html>"),
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end FluidStreamConversionWater;
