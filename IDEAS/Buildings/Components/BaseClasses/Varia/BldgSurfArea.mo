within IDEAS.Buildings.Components.BaseClasses.Varia;
connector BldgSurfArea
  "Port for adding up total external surface area of building"
  flow Modelica.SIunits.Area A "External surface area of building";
  Modelica.SIunits.Area Atot "Area port";
  annotation (Documentation(info="<html>
<p>
This connector is used to add up all internal energy terms of the model in the SimInfoManager.
</p>
</html>", revisions="<html>
<ul>
<li>
December 12, 2019, by Ian Beausoleil-Morrison:<br/>
First implementation.
</li>
</ul>
</html>"));
end BldgSurfArea;
