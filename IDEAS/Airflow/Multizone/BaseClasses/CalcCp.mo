within IDEAS.Airflow.Multizone.BaseClasses;
model CalcCp
  "Calculates wind-driven pressure coefficients for exterior building surfaces"
  extends Modelica.Blocks.Icons.Block;

  parameter Modelica.SIunits.Angle inc "Surface inclination";
  parameter Modelica.SIunits.Angle azi "Surface azimuth";

  Modelica.Blocks.Interfaces.RealOutput Cp "Pressure coefficient for surface"
    annotation (Placement(transformation(extent={{100,-4},{120,16}})));

  Modelica.Blocks.Interfaces.RealInput winSpe(unit="m/s") "Wind speed"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput winDir(unit="rad") "Wind direction"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));

equation

  Cp = 1*winSpe;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CalcCp;
