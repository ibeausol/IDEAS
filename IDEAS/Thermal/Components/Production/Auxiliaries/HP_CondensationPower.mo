within IDEAS.Thermal.Components.Production.Auxiliaries;
model HP_CondensationPower
  "Computation of theoretical condensation power of the refrigerant based on interpolation data"

  /*
  This model is based on data we received from Daikin from an Altherma heat pump.
  The nominal power of the original heat pump is 7177W at 2/35�C
   
  First, the thermal power and electricity consumption are interpolated for the 
  evaporator and condensing temperature at 4 different modulation levels.  The results
  are rescaled to the nominal power of the modelled heatpump (with QNom/QNom_data) and
  stored in 2 different vectors, Q_vector and P_vector.
  
  Finally, the modulation is calculated based on the asked power and the max power at 
  operating conditions: 
  - if modulation_init < modulation_min, the heat pump is OFF, modulation = 0.  
  - if modulation_init > 100%, the modulation is 100%
  - if modulation_init between modulation_min and modulation_start: hysteresis for on/off cycling.
  
  If the heat pump is on another interpolation is made to get P and Q at the real modulation.
  The COP is calculated as Q/P. 
  
  */
//protected
  parameter Thermal.Data.Interfaces.Medium medium=Data.Media.Water()
    "Medium in the component";
  final parameter Modelica.SIunits.Power QNomRef=7177
    "Nominal power of the Daikin Altherma.  See datafile";
  final parameter Real[5] mod_vector = {0, 30, 50, 90, 100}
    "5 modulation steps, %";
  Real[5] Q_vector "Thermal power for 5 modulation steps, in kW";
  Real[5] P_vector "Electrical power for 5 modulation steps, in kW";
  Modelica.SIunits.Power QMax
    "Maximum thermal power at specified evap and condr temperatures, in W";
  Modelica.SIunits.Power QAsked(start=0);

public
  parameter Modelica.SIunits.Power QNom=QNomRef "Nominal power at 2/35";
  parameter Real modulation_min(max=29)=25 "Minimal modulation percentage";
    // dont' set this to 0 or very low values, you might get negative P at very low modulations because of wrong extrapolation
  parameter Real modulation_start(min=min(30,modulation_min+5)) = 35
    "Min estimated modulation level required for start of HP";
  Real modulationInit "Initial modulation, decides on start/stop of the HP";
  Real modulation(min=0, max=1) "Current modulation percentage";
  Modelica.SIunits.Power PEl "Resulting electrical power";
  input Modelica.SIunits.Temperature TEvaporator "Evaporator temperature";
  input Modelica.SIunits.Temperature TCondensor_in "Condensor temperature";
  input Modelica.SIunits.Temperature TCondensor_set
    "Condensor setpoint temperature.  Not always possible to reach it";
  input Modelica.SIunits.MassFlowRate m_flowCondensor
    "Condensor mass flow rate";

protected
  Modelica.Blocks.Tables.CombiTable2D P100(
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,1.96,2.026,2.041,2.068,2.075,2.28,2.289,
        2.277,2.277; 35,2.08,2.174,2.199,2.245,2.266,2.508,2.537,2.547,2.547;
        40,2.23,2.338,2.374,2.439,2.473,2.755,2.804,2.838,2.838; 45,2.39,2.519,
        2.566,2.65,2.699,3.022,3.091,3.149,3.149; 50,2.56,2.718,2.777,2.88,2.942,
        3.309,3.399,3.481,3.481])
    annotation (Placement(transformation(extent={{-58,66},{-38,86}})));
  Modelica.Blocks.Tables.CombiTable2D P90(
       smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,1.76,1.79,1.8,1.81,1.81,1.94,1.93,1.9,
        1.9; 35,1.88,1.96,1.98,1.98,1.99,2.19,2.16,2.15,2.15; 40,2.01,2.11,2.14,
        2.16,2.18,2.42,2.4,2.41,2.41; 45,2.16,2.28,2.32,2.39,2.39,2.66,2.71,
        2.69,2.69; 50,2.32,2.46,2.51,2.6,2.61,2.92,2.99,3.05,3.05])
    annotation (Placement(transformation(extent={{-58,32},{-38,52}})));
  Modelica.Blocks.Tables.CombiTable2D P50(
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,1.14,1.11,1.09,1.02,0.98,0.98,0.92,0.81,
        0.81; 35,1.26,1.24,1.22,1.16,1.12,1.14,1.09,0.98,0.98; 40,1.39,1.39,
        1.37,1.35,1.28,1.36,1.28,1.21,1.21; 45,1.54,1.55,1.53,1.49,1.46,1.52,
        1.49,1.38,1.38; 50,1.68,1.73,1.72,1.68,1.66,1.75,1.72,1.62,1.62])
    annotation (Placement(transformation(extent={{-58,-6},{-38,14}})));
  Modelica.Blocks.Tables.CombiTable2D P30(
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,0.78,0.7,0.62,0.534,0.496,0.494,0.416,
        0.388,0.388; 35,0.9,0.82,0.71,0.602,0.561,0.563,0.477,0.453,0.453; 40,
        1.04,0.97,0.88,0.696,0.65,0.653,0.552,0.531,0.531; 45,1.17,1.13,1.04,
        0.86,0.774,0.773,0.646,0.625,0.625; 50,1.35,1.28,1.23,1.11,0.96,0.931,
        0.765,0.739,0.739])
    annotation (Placement(transformation(extent={{-58,-44},{-38,-24}})));
  Modelica.Blocks.Tables.CombiTable2D Q100(
     smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,4.82,5.576,6.023,6.892,7.642,10.208,11.652,
        13.518,13.518; 35,4.59,5.279,5.685,6.484,7.177,9.578,10.931,12.692,12.692;
        40,4.43,5.056,5.43,6.174,6.824,9.1,10.386,12.072,12.072; 45,4.32,4.906,
        5.255,5.957,6.576,8.765,10.008,11.647,11.647; 50,4.27,4.824,5.155,5.828,
        6.426,8.564,9.786,11.408,11.408])
    annotation (Placement(transformation(extent={{26,66},{46,86}})));
  Modelica.Blocks.Tables.CombiTable2D Q90(
     smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,4.338,5.019,5.42,6.203,6.877,9.188,10.486,
        12.166,12.166; 35,4.131,4.751,5.117,5.836,6.459,8.62,9.838,11.423,11.423;
        40,3.987,4.551,4.887,5.556,6.141,8.19,9.348,10.865,10.865; 45,3.888,
        4.415,4.73,5.361,5.918,7.888,9.007,10.483,10.483; 50,3.843,4.342,4.639,
        5.245,5.784,7.708,8.807,10.267,10.267])
    annotation (Placement(transformation(extent={{26,32},{46,52}})));
  Modelica.Blocks.Tables.CombiTable2D Q50(
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,2.41,2.788,3.011,3.446,3.821,5.104,5.826,
        6.759,6.759; 35,2.295,2.639,2.843,3.242,3.589,4.789,5.466,6.346,6.346;
        40,2.215,2.528,2.715,3.087,3.412,4.55,5.193,6.036,6.036; 45,2.16,2.453,
        2.628,2.979,3.288,4.382,5.004,5.824,5.824; 50,2.135,2.412,2.577,2.914,
        3.213,4.282,4.893,5.704,5.704])
    annotation (Placement(transformation(extent={{26,-6},{46,14}})));
  Modelica.Blocks.Tables.CombiTable2D Q30(
     smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative, table=[0,
        -15,-10,-7,-2,2,7,12,18,30; 30,1.446,1.673,1.807,2.068,2.292,3.063,3.495,
        4.055,4.055; 35,1.377,1.584,1.706,1.945,2.153,2.873,3.279,3.808,3.808;
        40,1.329,1.517,1.629,1.852,2.047,2.73,3.116,3.622,3.622; 45,1.296,1.472,
        1.577,1.787,1.973,2.629,3.002,3.494,3.494; 50,1.281,1.447,1.546,1.748,
        1.928,2.569,2.936,3.422,3.422])
    annotation (Placement(transformation(extent={{26,-44},{46,-24}})));

public
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    "heatPort connection to water in condensor"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Commons.General.Hyst_NoEvent onOff(
     uLow = modulation_min,
    uHigh = modulation_start) "on-off, based on modulationInit"
    annotation (Placement(transformation(extent={{-60,-88},{-40,-68}})));
equation
  onOff.u = modulationInit;
  QAsked = m_flowCondensor * medium.cp * (TCondensor_set - TCondensor_in);
  P100.u1 = heatPort.T - 273.15;
  P100.u2 = TEvaporator - 273.15;
  P90.u1 = heatPort.T - 273.15;
  P90.u2 = TEvaporator - 273.15;
  P50.u1 = heatPort.T - 273.15;
  P50.u2 = TEvaporator - 273.15;
  P30.u1 = heatPort.T - 273.15;
  P30.u2 = TEvaporator - 273.15;
  Q100.u1 = heatPort.T - 273.15;
  Q100.u2 = TEvaporator - 273.15;
  Q90.u1 = heatPort.T - 273.15;
  Q90.u2 = TEvaporator - 273.15;
  Q50.u1 = heatPort.T - 273.15;
  Q50.u2 = TEvaporator - 273.15;
  Q30.u1 = heatPort.T - 273.15;
  Q30.u2 = TEvaporator - 273.15;

  // all these are in kW
  Q_vector[1] = 0;
  Q_vector[2] = Q30.y * QNom/QNomRef;
  Q_vector[3] = Q50.y * QNom/QNomRef;
  Q_vector[4] = Q90.y * QNom/QNomRef;
  Q_vector[5] = Q100.y * QNom/QNomRef;
  P_vector[1] = 0;
  P_vector[2] = P30.y * QNom/QNomRef;
  P_vector[3] = P50.y * QNom/QNomRef;
  P_vector[4] = P90.y * QNom/QNomRef;
  P_vector[5] = P100.y * QNom/QNomRef;
  QMax = 1000* Q100.y * QNom/QNomRef;

  modulationInit = QAsked/QMax * 100;
  modulation = smooth(2, if noEvent(m_flowCondensor > 0 and onOff.y > 0.5) then min(modulationInit, 100) else 0);

  heatPort.Q_flow = -1000 * Modelica.Math.Vectors.interpolate(mod_vector, Q_vector, modulation);
  PEl = 1000 * Modelica.Math.Vectors.interpolate(mod_vector, P_vector, modulation);

  annotation (Diagram(graphics),
              Diagram(graphics));
end HP_CondensationPower;
