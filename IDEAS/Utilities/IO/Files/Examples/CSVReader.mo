within IDEAS.Utilities.IO.Files.Examples;
model CSVReader "Reader for csv files generated by CSVWriter"
  extends IDEAS.Utilities.IO.Files.Examples.BaseClasses.PartialCSV;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    fileName=Modelica.Utilities.Files.loadResource("modelica://IDEAS//Resources/Data/Utilities/IO/Files/Examples/CSVReader/Data.csv"),
    columns={2,3},
    tableName="csv") "Reader for test.csv"
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=-1.21,
      StopTime=10,
      Tolerance=1e-06),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Utilities/IO/Files/Examples/CSVReader.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This model demonstrates how a <code>CombiTimeTable</code> can be used
to read a csv file. The csv file is stored in
<code>IDEAS//Resources/Data/Utilities/IO/Files/Examples/CSVReader/Data.csv</code>.
It has the format of a file that can be generated by
<a href=\"modelica://IDEAS.Utilities.IO.Files.Examples.CSVWriter\">
IDEAS.Utilities.IO.Files.Examples.CSVWriter</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
July 10, 2018 by Michael Wetter:<br/>
Refactored implementation for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/983\">#983</a>.
</li>
<li>
May 14, 2018 by Filip Jorissen:<br/>
First implementation.
See <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/924\">#924</a>.
</li>
</ul>
</html>"));
end CSVReader;