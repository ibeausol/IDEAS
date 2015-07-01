within IDEAS.Fluid.Production.Interfaces.BaseClasses;
model IdealHeatSource
  //Extensions
  extends PartialHeatSource(
    modulating=false);

  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Utilities.Math.SmoothMax max(deltaX=1) "Maximum temperature"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
  connect(max.y,prescribedTemperature. T) annotation (Line(
      points={{-19,0},{-2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedTemperature.port, heatPort) annotation (Line(
      points={{20,0},{100,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(QAsked, max.u1) annotation (Line(
      points={{-110,30},{-80,30},{-80,6},{-42,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TinPrimary, max.u2) annotation (Line(
      points={{-80,-110},{-80,-6},{-42,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end IdealHeatSource;
