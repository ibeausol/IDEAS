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

  // Need to set G as a parameter.
  // Need to set incAng as a parameter: surface inc and Vdir.

  Cp = IDEAS.Airflow.Multizone.BaseClasses.windPressureLowRise(
    Cp0=0.6,
    G=0,
    incAng=0.25*Modelica.Constants.pi);


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CalcCp;
