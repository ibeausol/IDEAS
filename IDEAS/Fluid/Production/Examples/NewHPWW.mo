within IDEAS.Fluid.Production.Examples;
model NewHPWW "Test of a heat pump using a temperature setpoint"
  extends Modelica.Icons.Example;
    package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater
    annotation (__Dymola_choicesAllMatching=true);
  constant SI.MassFlowRate m_flow_nominal=0.3 "Nominal mass flow rate";

  Modelica.Blocks.Sources.Constant const(k=273.15 + 35)
    annotation (Placement(transformation(extent={{-2,40},{-20,58}})));
  Modelica.Blocks.Sources.Step     const1(
    height=-0.5,
    offset=1,
    startTime=500)
    annotation (Placement(transformation(extent={{4,-76},{-12,-60}})));
  Movers.Pump       pump1(
    m=1,
    useInput=false,
    redeclare package Medium = Medium,
    m_flow_nominal=4200/3600)
    annotation (Placement(transformation(extent={{-52,10},{-32,30}})));
  Sensors.TemperatureTwoPort TBrine_out(redeclare package Medium = Medium,
      m_flow_nominal=4200/3600)
    annotation (Placement(transformation(extent={{-32,-30},{-52,-10}})));
  Movers.Pump       pump(
    m=1,
    useInput=false,
    redeclare package Medium = Medium,
    m_flow_nominal=2550/3600,
    dpFix=50000)
    annotation (Placement(transformation(extent={{40,-30},{20,-10}})));
  Sensors.TemperatureTwoPort TWater_out(redeclare package Medium = Medium,
      m_flow_nominal=2550/3600)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Sources.Boundary_pT bou(          redeclare package Medium = Medium,
    use_T_in=true,
    p=200000,
    nPorts=1)
    annotation (Placement(transformation(extent={{78,2},{58,-18}})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=1/500,
    amplitude=5,
    offset=273.15 + 20,
    startTime=0)
    annotation (Placement(transformation(extent={{108,-20},{88,0}})));
  Sources.Boundary_pT bou1(         redeclare package Medium = Medium,
    use_T_in=true,
    p=200000,
    nPorts=1)
    annotation (Placement(transformation(extent={{-86,4},{-66,-16}})));
  Modelica.Blocks.Sources.Constant
                               sine1(k=273.15 + 15)
    annotation (Placement(transformation(extent={{-118,-20},{-98,0}})));
  NewHeatPumpWaterWater newHeatPumpWaterWater(use_onOffSignal=false, onOff=true)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-2,4})));
equation
  connect(sine1.y,bou1. T_in) annotation (Line(
      points={{-97,-10},{-88,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y,bou. T_in) annotation (Line(
      points={{87,-10},{86,-10},{86,-12},{80,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TWater_out.port_b, pump.port_a) annotation (Line(
      points={{40,20},{52,20},{52,-20},{40,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], pump.port_a) annotation (Line(
      points={{58,-8},{52,-8},{52,-20},{40,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.port_a, TBrine_out.port_b) annotation (Line(
      points={{-52,20},{-60,20},{-60,-20},{-52,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou1.ports[1], TBrine_out.port_b) annotation (Line(
      points={{-66,-6},{-60,-6},{-60,-20},{-52,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.port_b, newHeatPumpWaterWater.port_a1) annotation (Line(
      points={{-32,20},{-8,20},{-8,14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_b1, TBrine_out.port_a) annotation (Line(
      points={{-8,-6},{-8,-20},{-32,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_b2, TWater_out.port_a) annotation (Line(
      points={{4,14},{4,20},{20,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(newHeatPumpWaterWater.port_a2, pump.port_b) annotation (Line(
      points={{4,-6},{4,-20},{20,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const.y, newHeatPumpWaterWater.u) annotation (Line(
      points={{-20.9,49},{-26,49},{-26,0},{-12.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}}), graphics),
    __Dymola_Commands(file="modelica://IDEAS/Resources/Scripts/Dymola/Fluid/Production/Examples/HeatPump_WaterWaterTSet.mos"
        "Simulate and plot"),  Documentation(revisions="<html>
<ul>
<li>March 2014 by Filip Jorissen:<br/> 
Initial version
</li>
</ul>
</html>", info="<html>
<p>This model demonstrates the use of a heat pump with a temperature set point.</p>
</html>"),
    experiment(StopTime=1000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end NewHPWW;
